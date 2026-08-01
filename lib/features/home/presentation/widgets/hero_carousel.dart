import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({required this.banners, super.key, this.onBannerTap});

  final List<PromoBanner> banners;
  final ValueChanged<PromoBanner>? onBannerTap;

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
        return InkWell(
          onTap: onBannerTap == null ? null : () => onBannerTap!(banner),
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: AppNetworkImage(banner.imageUrl, width: 280, height: 160),
          ),
        );
      },
    ),
  );
}
