import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';
import 'package:rehlaa/features/home/domain/entities/home_category.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    required this.categories,
    required this.onSelected,
    super.key,
  });

  final List<HomeCategory> categories;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          final category = categories[index];

          return CategoryCard(
            key: ValueKey(category.id),
            icon: category.svgIcon,
            text: isArabic ? category.titleAr : category.titleEn,
            isSelected: category.isSelected,
            onPressed: () => onSelected(category.id),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  final String icon;
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: onPressed,
    child: SizedBox(
      width: 64,
      child: Column(
        children: [
          AnimatedContainer(
            duration: AppDurations.fast,
            padding: const EdgeInsets.all(AppSpacing.md),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.ecommercePrimaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: isSelected
                  ? const ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                  : null,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  );
}
