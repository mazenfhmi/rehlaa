import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/tokens/app_tokens.dart';
import '../../../../core/navigation/app_route_names.dart';
import 'section_title_widget.dart';

class SpecialOffersWidget extends StatelessWidget {
  const SpecialOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: SectionTitleWidget(
            title: "Special for you",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                // Using a placeholder image since assets/images/Image Banner 2.png might not exist
                image:
                    "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=600",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {
                  context.goNamed(AppRouteNames.cart); // Placeholder navigation
                },
              ),
              SpecialOfferCard(
                image:
                    "https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=600",
                category: "Fashion",
                numOfBrands: 24,
                press: () {
                  context.goNamed(AppRouteNames.cart);
                },
              ),
              const SizedBox(width: AppSpacing.lg),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.lg),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) => ColoredBox(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    child: const Center(
                      child: Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
