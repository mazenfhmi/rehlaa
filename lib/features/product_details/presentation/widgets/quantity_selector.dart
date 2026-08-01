import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    required this.label,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final String label;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(label, style: Theme.of(context).textTheme.titleMedium),
      ),
      IconButton.outlined(
        key: const Key('quantity_decrement'),
        constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        onPressed: onDecrement,
        icon: const Icon(Icons.remove),
      ),
      SizedBox(
        width: 48,
        child: Text(
          '$quantity',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      IconButton.filled(
        key: const Key('quantity_increment'),
        constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        onPressed: onIncrement,
        icon: const Icon(Icons.add),
      ),
    ],
  );
}
