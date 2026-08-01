import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';

class EmptyCartContent extends StatelessWidget {
  const EmptyCartContent({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: AppColors.black40,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.black60,
            ),
          ),
        ],
      ),
    );
}
