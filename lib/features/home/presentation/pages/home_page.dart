import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/home/presentation/providers/home_provider.dart';
import 'package:rehlaa/features/home/presentation/states/home_view_state.dart';
import 'package:rehlaa/features/home/presentation/widgets/category_section.dart';
import 'package:rehlaa/features/home/presentation/widgets/hero_carousel.dart';
import 'package:rehlaa/features/home/presentation/widgets/home_header.dart';
import 'package:rehlaa/features/home/presentation/widgets/product_section.dart';
import 'package:rehlaa/features/home/presentation/widgets/trust_benefits.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewAsync = ref.watch(homeViewModelProvider);
    final isOnline = ref.watch(isOnlineProvider).value ?? true;
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (!isOnline) const AppOfflineBanner(),
            Expanded(
              child: AppAsyncBuilder<HomeViewState>(
                value: viewAsync,
                error: (error, _) => AppErrorState(
                  message: error.toString(),
                  retryLabel: l10n.retryLabel,
                  onRetry: () =>
                      ref.read(homeViewModelProvider.notifier).refresh(),
                ),
                data: (viewState) => RefreshIndicator(
                  onRefresh: () =>
                      ref.read(homeViewModelProvider.notifier).refresh(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.lg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeHeader(searchHint: l10n.homeSearchHint),
                        const SizedBox(height: AppSpacing.xl),
                        if (viewState.feed.isStale) ...[
                          _CachedDataBanner(message: l10n.cachedDataMessage),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        if (viewState.feed.banners.isNotEmpty) ...[
                          HeroCarousel(banners: viewState.feed.banners),
                          const SizedBox(height: AppSpacing.xl),
                        ],
                        TrustBenefits(
                          securePaymentsLabel: l10n.securePaymentsLabel,
                          instantDeliveryLabel: l10n.instantDeliveryLabel,
                          supportAnytimeLabel: l10n.supportAnytimeLabel,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        if (viewState.feed.categories.isNotEmpty) ...[
                          CategorySection(
                            title: l10n.categoriesTitle,
                            categories: viewState.feed.categories,
                            selectedCategoryId: viewState.selectedCategoryId,
                            onSelected: ref
                                .read(homeViewModelProvider.notifier)
                                .selectCategory,
                          ),
                          const SizedBox(height: AppSpacing.xl),
                        ],
                        ProductSection(
                          title: l10n.exclusiveOffersTitle,
                          products: viewState.feed.exclusiveOffers,
                          emptyLabel: l10n.noItemsFound,
                          horizontal: true,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        ProductSection(
                          title: l10n.featuredProductsTitle,
                          products: viewState.visibleFeaturedProducts,
                          emptyLabel: l10n.noItemsFound,
                        ),
                      ],
                    ),
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

class _CachedDataBanner extends StatelessWidget {
  const _CachedDataBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        color: colors.tertiaryContainer,
        padding: const EdgeInsets.all(AppSpacing.sm),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 18,
              color: colors.onTertiaryContainer,
            ),
            const SizedBox(width: AppSpacing.xs),
            Flexible(
              child: Text(
                message,
                style: TextStyle(color: colors.onTertiaryContainer),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
