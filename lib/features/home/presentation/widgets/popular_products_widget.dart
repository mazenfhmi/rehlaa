import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'section_title_widget.dart';

class PopularProductsWidget extends StatelessWidget {
  const PopularProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: SectionTitleWidget(
            title: "Popular Products",
            press: () {
              // Navigate to products
            },
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                3, // Demo item count
                (index) => Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.lg),
                  child: AppProductCard(
                    image: 'https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=400',
                    brandName: 'PUBG MOBILE',
                    title: '660 UC Prepaid Code',
                    price: 39.99,
                    priceAfterDiscount: 29.99,
                    discountPercent: 25,
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
            ],
          ),
        )
      ],
    );
  }
}
