import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/network/connectivity_service.dart';
import '../view_models/home_view_model.dart';
import '../widgets/categories_widget.dart';
import '../widgets/discount_banner_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/popular_products_widget.dart';
import '../widgets/special_offers_widget.dart';

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
