import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/favorites/presentation/view_models/favorites_view_model.dart';
import 'package:rehlaa/shared/presentation/widgets/product_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesViewModelProvider);

    return AppScaffold(
      appBar: const AppPageHeader(title: 'Favorites'),
      body: state.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Text(
                'No favorites yet',
                style: Theme.of(context).textTheme.titleMedium,
              ),
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
            itemBuilder: (context, index) => ProductCard.grid(
                product: favorites[index],
                onTap: () {},
              ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toString())),
      ),
    );
  }
}
