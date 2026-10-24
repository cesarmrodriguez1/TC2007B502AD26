import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dish.dart';
import '../models/cart_item.dart';

import '../providers/cart_provider.dart';

import '../widgets/quantity_selector.dart';


class DishDetailScreen
    extends StatefulWidget {

  final Dish dish;

  const DishDetailScreen({
    super.key,
    required this.dish,
  });

  @override
  State<DishDetailScreen>
      createState() =>
          _DishDetailScreenState();
}


class _DishDetailScreenState
    extends State<DishDetailScreen> {

  int _quantity = 1;


  void _addToCart() async {
    final item =
        CartItem(
      dishId:
          widget.dish.id,

      name:
          widget.dish.name,

      price:
          widget.dish.price,

      quantity:
          _quantity,

      image:
          widget.dish.image,
    );

    await context
        .read<CartProvider>()
        .addItem(item);

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      const SnackBar(
        content:
            Text(
          'Platillo agregado al carrito.',
        ),
      ),
    );
  }


  @override
  Widget build(
    BuildContext context,
  ) {
    final dish =
        widget.dish;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text(
          'Platillo',
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            SizedBox(
              height: 280,
              width: double.infinity,

              child:
                  Image.network(
                dish.image,

                fit:
                    BoxFit.cover,

                errorBuilder:
                    (
                  context,
                  error,
                  stackTrace,
                ) {
                  return Container(
                    color:
                        Colors.grey.shade200,

                    child:
                        const Icon(
                      Icons.restaurant,
                      size: 80,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(
                20,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    dish.name,

                    style:
                        const TextStyle(
                      fontSize: 28,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    dish.description,

                    style:
                        const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    '\$${dish.price.toStringAsFixed(2)}',

                    style:
                        const TextStyle(
                      fontSize: 25,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  const Text(
                    'Cantidad',

                    style:
                        TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  QuantitySelector(
                    quantity:
                        _quantity,

                    onDecrease: () {
                      if (_quantity >
                          1) {
                        setState(() {
                          _quantity--;
                        });
                      }
                    },

                    onIncrease: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  SizedBox(
                    width:
                        double.infinity,

                    height: 54,

                    child:
                        FilledButton.icon(
                      onPressed:
                          _addToCart,

                      icon:
                          const Icon(
                        Icons.shopping_cart,
                      ),

                      label:
                          const Text(
                        'Agregar al carrito',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}