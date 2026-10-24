import 'package:flutter/material.dart';


class QuantitySelector
    extends StatelessWidget {

  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });


  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisSize:
          MainAxisSize.min,

      children: [

        IconButton(
          onPressed:
              onDecrease,

          icon:
              const Icon(
            Icons.remove_circle_outline,
          ),
        ),

        Text(
          '$quantity',

          style:
              const TextStyle(
            fontSize: 18,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        IconButton(
          onPressed:
              onIncrease,

          icon:
              const Icon(
            Icons.add_circle_outline,
          ),
        ),
      ],
    );
  }
}