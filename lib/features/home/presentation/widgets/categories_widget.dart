import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/design_system/tokens/app_tokens.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Icons might not exist in the current project, fallback to IconData if needed
    // or just rely on SVGs if they are added later.
    final List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "fallback": Icons.flash_on, "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "fallback": Icons.receipt, "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "fallback": Icons.videogame_asset, "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "fallback": Icons.card_giftcard, "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "fallback": Icons.more_horiz, "text": "More"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            iconFallback: categories[index]["fallback"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    this.iconFallback,
    required this.text,
    required this.press,
  });

  final String icon;
  final IconData? iconFallback;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 56,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: AppColors.ecommercePrimaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Builder(
                builder: (context) {
                  // In a real app we'd load the SVG. We use a try-catch pattern or just
                  // assume SVGs might fail if not present.
                  // For now, if we don't have the SVG, we can at least show it if available
                  // Since we are preserving architecture and just applying UI, we will use SvgPicture
                  // But as a fallback we will try to use iconFallback if SvgPicture fails (not easily done without errorBuilder).
                  // We will just use SvgPicture and let it throw if asset is missing, or we can use Icon for now.
                  // The prompt requires applying the UI design, so we stick to SvgPicture.
                  return SvgPicture.asset(icon);
                },
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
