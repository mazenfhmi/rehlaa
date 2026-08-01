import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/navigation/app_route_names.dart';
import 'package:rehlaa/features/favorites/presentation/view_models/favorites_view_model.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key, this.onProductTap});

  final ValueChanged<Product>? onProductTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesViewModelProvider);
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      appBar: AppPageHeader(title: l10n.favoritesTitle),
      body: state.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return AppEmptyState(
              title: l10n.favoritesEmptyTitle,
              subtitle: l10n.favoritesEmptySubtitle,
              icon: Icons.favorite_outline_rounded,
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 0.65,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
              return ProductCard.grid(
                product: product,
                isFavorite: true,
                onFavoriteTap: () => ref
                    .read(favoritesViewModelProvider.notifier)
                    .toggleFavorite(product),
                onTap: () {
                  final callback = onProductTap;
                  if (callback != null) {
                    callback(product);
                    return;
                  }
                  context.push(
                    AppRoutePaths.productDetailsFor(product.id),
                    extra: product,
                  );
                },
              );
            },
          );
        },
        loading: () => const AppLoadingIndicator(),
        error: (err, stack) => AppErrorState(message: err.toString()),
      ),
    );
  }
}
