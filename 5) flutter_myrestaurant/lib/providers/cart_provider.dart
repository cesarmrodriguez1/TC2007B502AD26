import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/cart_item.dart';
import '../services/cart_service.dart';


class CartProvider
    extends ChangeNotifier {

  final CartService _cartService =
      CartService();

  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  List<CartItem> _items = [];

  StreamSubscription<List<CartItem>>?
      _cartSubscription;


  List<CartItem> get items =>
      List.unmodifiable(
        _items,
      );


  int get itemCount {
    return _items.fold(
      0,
      (
        sum,
        item,
      ) =>
          sum +
          item.quantity,
    );
  }


  double get total {
    return _items.fold<double>(
      0,
      (
        sum,
        item,
      ) =>
          sum +
          item.price *
              item.quantity,
    );
  }


  CartProvider() {
    _listenToCart();
  }


  void _listenToCart() {
    final user =
        _auth.currentUser;

    if (user == null) {
      return;
    }

    _cartSubscription =
        _cartService
            .cartStream(
              user.uid,
            )
            .listen(
              (items) {
                _items = items;
                notifyListeners();
              },
            );
  }


  Future<void> refreshCart() async {
    final user =
        _auth.currentUser;

    if (user == null) {
      _items = [];
      notifyListeners();
      return;
    }

    _cartSubscription?.cancel();

    _listenToCart();

    _items =
        await _cartService.getCart(
      user.uid,
    );

    notifyListeners();
  }


  Future<void> addItem(
    CartItem item,
  ) async {
    final index =
        _items.indexWhere(
      (element) =>
          element.dishId ==
          item.dishId,
    );

    if (index >= 0) {
      final existing =
          _items[index];

      _items[index] =
          existing.copyWith(
        quantity:
            existing.quantity +
            item.quantity,
      );
    } else {
      _items.add(item);
    }

    notifyListeners();

    await _save();
  }


  Future<void> increaseQuantity(
    String dishId,
  ) async {
    final index =
        _items.indexWhere(
      (item) =>
          item.dishId ==
          dishId,
    );

    if (index < 0) {
      return;
    }

    final item =
        _items[index];

    _items[index] =
        item.copyWith(
      quantity:
          item.quantity + 1,
    );

    notifyListeners();

    await _save();
  }


  Future<void> decreaseQuantity(
    String dishId,
  ) async {
    final index =
        _items.indexWhere(
      (item) =>
          item.dishId ==
          dishId,
    );

    if (index < 0) {
      return;
    }

    final item =
        _items[index];

    if (item.quantity <= 1) {
      _items.removeAt(index);
    } else {
      _items[index] =
          item.copyWith(
        quantity:
            item.quantity - 1,
      );
    }

    notifyListeners();

    await _save();
  }


  Future<void> removeItem(
    String dishId,
  ) async {
    _items.removeWhere(
      (item) =>
          item.dishId ==
          dishId,
    );

    notifyListeners();

    await _save();
  }


  Future<void> clear() async {
    _items.clear();

    notifyListeners();

    final user =
        _auth.currentUser;

    if (user != null) {
      await _cartService.clearCart(
        user.uid,
      );
    }
  }


  Future<void> _save() async {
    final user =
        _auth.currentUser;

    if (user == null) {
      return;
    }

    await _cartService.saveCart(
      userId: user.uid,
      items: _items,
    );
  }


  @override
  void dispose() {
    _cartSubscription?.cancel();
    super.dispose();
  }
}