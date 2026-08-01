import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/cart/domain/entities/cart_item.dart';
import 'package:rehlaa/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class CartItemTile extends ConsumerWidget {

  const CartItemTile({required this.item, super.key});
  final CartItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        ref.read(cartViewModelProvider.notifier).removeItem(item.id);
      },
      background: Container(
        color: AppColors.primaryDark,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.lg),
        child: const Icon(Icons.delete, color: AppColors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        child: ProductCard.horizontal(
          product: item.product,
          onTap: () {},
        ),
      ),
    );
}
