import 'package:flutter/material.dart';

import '../models/dish.dart';


class DishCard
    extends StatelessWidget {

  final Dish dish;
  final VoidCallback onTap;

  const DishCard({
    super.key,
    required this.dish,
    required this.onTap,
  });


  @override
  Widget build(
    BuildContext context,
  ) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 14,
      ),

      clipBehavior:
          Clip.antiAlias,

      elevation: 3,

      child: InkWell(
        onTap: onTap,

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            SizedBox(
              height: 180,
              width: double.infinity,

              child: Image.network(
                dish.image,

                fit: BoxFit.cover,

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
                      size: 60,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(
                14,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    dish.name,

                    style:
                        const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    dish.description,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style:
                        TextStyle(
                      color:
                          Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        '\$${dish.price.toStringAsFixed(2)}',

                        style:
                            const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      FilledButton.icon(
                        onPressed:
                            onTap,

                        icon:
                            const Icon(
                          Icons.add_shopping_cart,
                        ),

                        label:
                            const Text(
                          'Agregar',
                        ),
                      ),
                    ],
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