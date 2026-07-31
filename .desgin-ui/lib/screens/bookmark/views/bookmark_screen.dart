import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/providers/bookmark_provider.dart';
import 'package:shop/route/route_constants.dart';

import '../../../constants.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkProvider);

    if (bookmarks.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bookmark_outline, size: 64, color: greyColor),
              const SizedBox(height: defaultPadding),
              Text(
                "No bookmarked items yet",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.66,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final product = bookmarks[index];
                  return ProductCard(
                    image: product.image,
                    brandName: product.brandName,
                    title: product.title,
                    price: product.price,
                    priceAfterDiscount: product.priceAfterDiscount,
                    discountPercent: product.discountPercent,
                    press: () {
                      Navigator.pushNamed(context, productDetailsScreenRoute);
                    },
                  );
                },
                childCount: bookmarks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
