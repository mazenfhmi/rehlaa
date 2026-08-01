import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/components/images/app_network_image.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// Card components
// Adapted from .desgin-ui/lib/components/card_info.dart and product cards
// ---------------------------------------------------------------------------

/// Standard outlined card matching the reference border/radius style.
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(AppSpacing.base),
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.showBorder = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(AppRadius.md);
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).cardTheme.color,
          borderRadius: radius,
          border: showBorder
              ? Border.all(color: Theme.of(context).dividerColor)
              : null,
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

// ---------------------------------------------------------------------------

/// Payment / wallet card matching .desgin-ui/lib/components/card_info.dart
class AppPaymentCard extends StatelessWidget {
  const AppPaymentCard({
    required this.last4Digits,
    required this.name,
    required this.expiryDate,
    super.key,
    this.isSelected = false,
    this.onTap,
    this.backgroundColor = AppColors.primary,
  });

  final String last4Digits;
  final String name;
  final String expiryDate;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AspectRatio(
      aspectRatio: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.xl)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.credit_card_rounded,
                          color: AppColors.white,
                          size: 32,
                        ),
                        if (isSelected)
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColors.white,
                            child: Icon(
                              Icons.check_rounded,
                              color: backgroundColor,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '**** **** **** $last4Digits',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'PlusJakarta',
                      ),
                    ),
                    const SizedBox(height: AppSpacing.base),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.base),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(AppRadius.xl),
                ),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                  fontFamily: 'PlusJakarta',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(name), Text(expiryDate)],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// ---------------------------------------------------------------------------

/// Product card — grid view, matching .desgin-ui/lib/components/product/product_card.dart
class AppProductCard extends StatelessWidget {
  const AppProductCard({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    required this.onTap,
    super.key,
    this.priceAfterDiscount,
    this.discountPercent,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.currencySymbol = 'SAR',
  });

  final String image;
  final String brandName;
  final String title;
  final double price;
  final double? priceAfterDiscount;
  final int? discountPercent;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: onTap,
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(140, 260),
      maximumSize: const Size(140, 260),
      padding: const EdgeInsets.all(8),
    ),
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 1.15,
          child: Stack(
            children: [
              AppNetworkImage(image),
              if (discountPercent != null)
                Positioned(
                  right: AppSpacing.sm,
                  top: AppSpacing.sm,
                  child: _DiscountBadge(percent: discountPercent!),
                ),
              if (onFavoriteTap != null)
                Positioned(
                  left: AppSpacing.xs,
                  top: AppSpacing.xs,
                  child: _FavoriteButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap!,
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brandName.toUpperCase(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 10),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 12),
                ),
                const Spacer(),
                _PriceRow(
                  price: price,
                  priceAfterDiscount: priceAfterDiscount,
                  currencySymbol: currencySymbol,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// ---------------------------------------------------------------------------

/// Horizontal product card — list view, matching secondary_product_card.dart
class AppProductHorizontalCard extends StatelessWidget {
  const AppProductHorizontalCard({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    super.key,
    this.priceAfterDiscount,
    this.discountPercent,
    this.onTap,
    this.currencySymbol = 'SAR',
  });

  final String image;
  final String brandName;
  final String title;
  final double price;
  final double? priceAfterDiscount;
  final int? discountPercent;
  final VoidCallback? onTap;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: onTap ?? () {},
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(256, 114),
      maximumSize: const Size(256, 114),
      padding: const EdgeInsets.all(8),
    ),
    child: Row(
      children: [
        AspectRatio(
          aspectRatio: 1.15,
          child: Stack(
            children: [
              AppNetworkImage(image),
              if (discountPercent != null)
                Positioned(
                  right: AppSpacing.sm,
                  top: AppSpacing.sm,
                  child: _DiscountBadge(percent: discountPercent!),
                ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brandName.toUpperCase(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 10),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 12),
                ),
                const Spacer(),
                _PriceRow(
                  price: price,
                  priceAfterDiscount: priceAfterDiscount,
                  currencySymbol: currencySymbol,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// ---------------------------------------------------------------------------
// Blur container — from .desgin-ui/lib/components/blur_container.dart
// ---------------------------------------------------------------------------

/// Glassmorphism frosted-glass container with text.
class AppBlurContainer extends StatelessWidget {
  const AppBlurContainer({
    required this.text,
    super.key,
    this.height = 40,
    this.width = 40,
    this.fontSize = 18,
  });

  final String text;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(AppRadius.sm)),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: height,
        width: width,
        color: Colors.white12,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'PlusJakarta',
          ),
        ),
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Internal helpers
// ---------------------------------------------------------------------------

class _DiscountBadge extends StatelessWidget {
  const _DiscountBadge({required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
    height: 16,
    decoration: const BoxDecoration(
      color: AppColors.error,
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
    ),
    child: Text(
      '$percent% off',
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: 'PlusJakarta',
      ),
    ),
  );
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.isFavorite, required this.onTap});

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: isFavorite ? AppColors.error : AppColors.black40,
        size: 16,
      ),
    ),
  );
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.price,
    required this.currencySymbol,
    this.priceAfterDiscount,
  });

  final double price;
  final double? priceAfterDiscount;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) {
    if (priceAfterDiscount != null) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.xs,
        runSpacing: AppSpacing.xs,
        children: [
          Text(
            '${priceAfterDiscount!.toStringAsFixed(2)} $currencySymbol',
            style: const TextStyle(
              color: AppColors.info,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: 'PlusJakarta',
            ),
          ),
          Text(
            price.toStringAsFixed(2),
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: 10,
              decoration: TextDecoration.lineThrough,
              fontFamily: 'PlusJakarta',
            ),
          ),
        ],
      );
    }
    return Text(
      '${price.toStringAsFixed(2)} $currencySymbol',
      style: const TextStyle(
        color: AppColors.info,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: 'PlusJakarta',
      ),
    );
  }
}
