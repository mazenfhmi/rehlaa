import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/shared/domain/catalog/category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    required this.title,
    required this.categories,
    required this.onSelected,
    super.key,
    this.selectedCategoryId,
  });

  final String title;
  final List<Category> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: title),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 104,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category.id == selectedCategoryId;
              return Semantics(
                selected: isSelected,
                button: true,
                child: InkWell(
                  key: ValueKey('home-category-${category.id}'),
                  onTap: () => onSelected(isSelected ? null : category.id),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: AppDurations.fast,
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? colors.primaryContainer
                                : colors.surfaceContainerHighest,
                            border: isSelected
                                ? Border.all(color: colors.primary, width: 2)
                                : null,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: AppNetworkImage(
                            category.imageUrl,
                            radius: 100,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          isRtl ? category.nameAr : category.nameEn,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
    child: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
