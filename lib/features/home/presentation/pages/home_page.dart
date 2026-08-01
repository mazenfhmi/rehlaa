import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/features/home/presentation/providers/home_provider.dart';
import 'package:rehlaa/shared/domain/catalog/category.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedAsync = ref.watch(homeFeedViewModelProvider);
    final isOnline = ref.watch(isOnlineProvider).value ?? true;

    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (!isOnline) const AppOfflineBanner(),
            Expanded(
              child: AppAsyncBuilder(
                value: feedAsync,
                data: (feed) => SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (feed.isStale)
                          Container(
                            color: AppColors.warning.withValues(alpha: 0.2),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: const Text('Showing offline cached data'),
                          ),
                        if (feed.banners.isNotEmpty) ...[
                          _PromoCarousel(banners: feed.banners),
                          const SizedBox(height: AppSpacing.xl),
                        ],
                        if (feed.categories.isNotEmpty) ...[
                          _CategoryList(categories: feed.categories),
                          const SizedBox(height: AppSpacing.xl),
                        ],
                        if (feed.featuredProducts.isNotEmpty) ...[
                          const _SectionTitle(title: 'Featured Products'),
                          const SizedBox(height: AppSpacing.md),
                          _FeaturedGrid(products: feed.featuredProducts),
                        ],
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

class _PromoCarousel extends StatelessWidget {

  const _PromoCarousel({required this.banners});
  final List<PromoBanner> banners;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 160,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          final banner = banners[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: AppNetworkImage(
              banner.imageUrl,
              width: 280,
              height: 160,
            ),
          );
        },
      ),
    );
}

class _CategoryList extends StatelessWidget {

  const _CategoryList({required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: isRtl ? 'الفئات' : 'Categories'),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black5,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AppNetworkImage(
                        cat.imageUrl,
                        radius: 100, // Make it circular
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isRtl ? cat.nameAr : cat.nameEn,
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FeaturedGrid extends StatelessWidget {

  const _FeaturedGrid({required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) => GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.lg,
        crossAxisSpacing: AppSpacing.md,
        childAspectRatio: 0.65,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard.grid(
          product: products[index],
          onTap: () {},
        ),
    );
}

class _SectionTitle extends StatelessWidget {

  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Text(
        title,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
