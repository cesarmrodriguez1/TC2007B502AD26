import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

import '../models/category.dart';
import '../models/dish.dart';

//import '../providers/cart_provider.dart';

//import '../services/auth_service.dart';
import '../services/menu_service.dart';

import '../widgets/dish_card.dart';

//import 'cart_screen.dart';
import 'dish_detail_screen.dart';


class MenuScreen
    extends StatefulWidget {

  const MenuScreen({
    super.key,
  });

  @override
  State<MenuScreen>
      createState() =>
          _MenuScreenState();
}


class _MenuScreenState
    extends State<MenuScreen> {

  final _menuService =
      MenuService();

  //final _authService =
   //   AuthService();

  String? _selectedCategory;


  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text(
          'Restaurant App',
        ),

        actions: [
          PopupMenuButton<String>(
            onSelected:
                (value) async {
              if (value ==
                  'logout') {
                //await _authService
                  //  .logout();
              }
            },

            itemBuilder:
                (context) {
              return const [
                PopupMenuItem(
                  value: 'logout',
                  child:
                      Text(
                    'Cerrar sesión',
                  ),
                ),
              ];
            },
          ),
        ],
      ),

      body: StreamBuilder<List<Category>>(
        stream:
            _menuService
                .categoriesStream(),

        builder:
            (
          context,
          categorySnapshot,
        ) {
          return StreamBuilder<List<Dish>>(
            stream:
                _menuService
                    .dishesStream(),

            builder:
                (
              context,
              dishSnapshot,
            ) {
              if (
                categorySnapshot
                        .connectionState ==
                    ConnectionState.waiting ||
                dishSnapshot
                        .connectionState ==
                    ConnectionState.waiting
              ) {
                return const Center(
                  child:
                      CircularProgressIndicator(),
                );
              }

              if (
                categorySnapshot.hasError ||
                dishSnapshot.hasError
              ) {
                return Center(
                  child:
                      Text(
                    'No fue posible cargar el menú.',
                  ),
                );
              }

              final categories =
                  categorySnapshot.data ??
                  [];

              final dishes =
                  dishSnapshot.data ??
                  [];

              final filteredDishes =
                  _selectedCategory ==
                          null
                      ? dishes
                      : dishes
                          .where(
                            (dish) =>
                                dish.category ==
                                _selectedCategory,
                          )
                          .toList();

              return Column(
                children: [

                  const SizedBox(
                    height: 12,
                  ),

                  SizedBox(
                    height: 48,

                    child:
                        ListView(
                      scrollDirection:
                          Axis.horizontal,

                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 12,
                      ),

                      children: [

                        Padding(
                          padding:
                              const EdgeInsets
                                  .only(
                            right: 8,
                          ),

                          child:
                              ChoiceChip(
                            label:
                                const Text(
                              'Todos',
                            ),

                            selected:
                                _selectedCategory ==
                                    null,

                            onSelected:
                                (_) {
                              setState(() {
                                _selectedCategory =
                                    null;
                              });
                            },
                          ),
                        ),

                        ...categories.map(
                          (
                            category,
                          ) {
                            return Padding(
                              padding:
                                  const EdgeInsets
                                      .only(
                                right: 8,
                              ),

                              child:
                                  ChoiceChip(
                                label:
                                    Text(
                                  category.name,
                                ),

                                selected:
                                    _selectedCategory ==
                                        category.id,

                                onSelected:
                                    (_) {
                                  setState(() {
                                    _selectedCategory =
                                        category.id;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Expanded(
                    child:
                        filteredDishes.isEmpty
                            ? const Center(
                                child:
                                    Text(
                                  'No hay platillos disponibles.',
                                ),
                              )
                            : ListView.builder(
                                padding:
                                    const EdgeInsets
                                        .all(
                                  12,
                                ),

                                itemCount:
                                    filteredDishes
                                        .length,

                                itemBuilder:
                                    (
                                  context,
                                  index,
                                ) {
                                  final dish =
                                      filteredDishes[
                                          index];

                                  return DishCard(
                                    dish:
                                        dish,

                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) =>
                                                  DishDetailScreen(
                                            dish:
                                                dish,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}