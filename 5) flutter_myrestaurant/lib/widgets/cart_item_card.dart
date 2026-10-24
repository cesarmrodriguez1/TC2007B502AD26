import 'package:flutter/material.dart';

import '../models/cart_item.dart';

import 'quantity_selector.dart';


class CartItemCard
    extends StatelessWidget {

  final CartItem item;

  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
  });


  @override
  Widget build(
    BuildContext context,
  ) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),

      child: Padding(
        padding:
            const EdgeInsets.all(
          10,
        ),

        child: Row(
          children: [

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(
                10,
              ),

              child: Image.network(
                item.image,

                width: 85,
                height: 85,

                fit: BoxFit.cover,

                errorBuilder:
                    (
                  context,
                  error,
                  stackTrace,
                ) {
                  return Container(
                    width: 85,
                    height: 85,

                    color:
                        Colors.grey.shade200,

                    child:
                        const Icon(
                      Icons.restaurant,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              width: 12,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    item.name,

                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    '\$${item.price.toStringAsFixed(2)}',

                    style:
                        TextStyle(
                      color:
                          Colors.grey.shade700,
                    ),
                  ),

                  QuantitySelector(
                    quantity:
                        item.quantity,

                    onDecrease:
                        onDecrease,

                    onIncrease:
                        onIncrease,
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed:
                  onRemove,

              icon:
                  const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}