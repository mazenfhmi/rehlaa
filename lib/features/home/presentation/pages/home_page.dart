import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/home/presentation/view_models/home_view_model.dart';
import 'package:rehlaa/features/home/presentation/widgets/categories_widget.dart';
import 'package:rehlaa/features/home/presentation/widgets/discount_banner_widget.dart';
import 'package:rehlaa/features/home/presentation/widgets/home_header_widget.dart';
import 'package:rehlaa/features/home/presentation/widgets/popular_products_widget.dart';
import 'package:rehlaa/features/home/presentation/widgets/special_offers_widget.dart';

/// Home Page matching the design reference from ui.txt.
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(homeCategoriesViewModelProvider);
    final isOnline = ref.watch(isOnlineProvider).value ?? true;

    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (!isOnline) const AppOfflineBanner(),
            Expanded(
              child: AppAsyncBuilder(
                value: categoriesAsync,
                data: (categories) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  child: Column(
                    children: [
                      const HomeHeaderWidget(),
                      const SizedBox(height: AppSpacing.lg),
                      const DiscountBannerWidget(),
                      CategoriesWidget(
                        categories: categories,
                        onSelected: (id) => ref
                            .read(homeCategoriesViewModelProvider.notifier)
                            .selectCategory(id),
                      ),
                      const SpecialOffersWidget(),
                      const SizedBox(height: AppSpacing.xl),
                      const PopularProductsWidget(),
                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
