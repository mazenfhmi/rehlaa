import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/network/connectivity_service.dart';
import '../view_models/home_view_model.dart';

/// Home Page matching the design reference layout and components.
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(homeCategoriesViewModelProvider);
    final isOnline = ref.watch(isOnlineProvider).valueOrNull ?? true;

    return AppScaffold(
      appBar: AppPageHeader(
        title: 'Rehlaa',
        actions: [
          AppIconButton.svg(
            svgPath: 'assets/icons/Search.svg',
            onPressed: () {},
          ),
          AppIconButton.svg(
            svgPath: 'assets/icons/Notification.svg',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          if (!isOnline) const AppOfflineBanner(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.base),
              children: [
                // Offer Banner Carousel Placeholder
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.base,
                  ),
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SPECIAL OFFER',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: 0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          '50% OFF',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Get discounts on top game cards',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: 0.9),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // Categories Section
                AppSectionHeader(
                  title: 'Categories',
                  onTrailingTap: () {},
                ),
                const SizedBox(height: AppSpacing.sm),

                SizedBox(
                  height: 40,
                  child: AppAsyncBuilder(
                    value: categoriesAsync,
                    skeleton: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.base,
                      ),
                      itemCount: 4,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (context, index) => const AppSkeleton(
                        width: 100,
                        height: 40,
                        radius: AppRadius.full,
                      ),
                    ),
                    data: (categories) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.base,
                      ),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        final isAr =
                            Localizations.localeOf(context).languageCode == 'ar';
                        return AppToggleButton(
                          label: isAr ? cat.titleAr : cat.titleEn,
                          isActive: cat.isSelected,
                          onPressed: () => ref
                              .read(homeCategoriesViewModelProvider.notifier)
                              .selectCategory(cat.id),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // Popular Products Section
                AppSectionHeader(
                  title: 'Popular Products',
                  onTrailingTap: () {},
                ),
                const SizedBox(height: AppSpacing.sm),

                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.base,
                    ),
                    itemCount: 4,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: AppSpacing.sm),
                    itemBuilder: (context, index) => AppProductCard(
                      image:
                          'https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=400',
                      brandName: 'PUBG MOBILE',
                      title: '660 UC Prepaid Code',
                      price: 39.99,
                      priceAfterDiscount: 29.99,
                      discountPercent: 25,
                      onTap: () {},
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // Best Sellers Section
                AppSectionHeader(
                  title: 'Best Sellers',
                  onTrailingTap: () {},
                ),
                const SizedBox(height: AppSpacing.sm),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollablePhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.base,
                  ),
                  itemCount: 3,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) => AppProductHorizontalCard(
                    image:
                        'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=400',
                    brandName: 'PLAYSTATION',
                    title: '\$50 USD PlayStation Store Gift Card',
                    price: 50.00,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
