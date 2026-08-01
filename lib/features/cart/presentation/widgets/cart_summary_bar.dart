import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/cart/domain/entities/cart.dart';
import 'package:rehlaa/shared/presentation/widgets/product_price.dart';

class CartSummaryBar extends StatelessWidget {

  const CartSummaryBar({
    required this.cart, required this.onCheckout, super.key,
  });
  final Cart cart;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: AppShadows.lg,
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ProductPrice(currentPrice: cart.subtotal),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCheckout,
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
}
