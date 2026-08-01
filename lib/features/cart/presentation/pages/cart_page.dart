import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:rehlaa/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:rehlaa/features/cart/presentation/widgets/cart_summary_bar.dart';
import 'package:rehlaa/features/cart/presentation/widgets/empty_cart_content.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartViewModelProvider);

    return AppScaffold(
      appBar: const AppPageHeader(title: 'Cart'),
      body: cart.items.isEmpty
          ? const EmptyCartContent()
          : Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return CartItemTile(item: item);
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CartSummaryBar(
                    cart: cart,
                    onCheckout: () {},
                  ),
                ),
              ],
            ),
    );
  }
}
