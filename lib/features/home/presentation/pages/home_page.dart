import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
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
    return AppScaffold(
      // We don't use the standard AppBar here since ui.txt provides a custom HomeHeader
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: Column(
            children: [
              HomeHeaderWidget(),
              SizedBox(height: AppSpacing.lg),
              DiscountBannerWidget(),
              CategoriesWidget(),
              SpecialOffersWidget(),
              SizedBox(height: AppSpacing.xl),
              PopularProductsWidget(),
              SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
