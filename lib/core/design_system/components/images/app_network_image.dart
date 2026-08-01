import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/components/feedback/app_skeleton.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// AppNetworkImage
// Adapted from .desgin-ui/lib/components/network_image_with_loader.dart
// ---------------------------------------------------------------------------

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.src, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = AppRadius.md,
    this.width,
    this.height,
  });

  final String src;
  final BoxFit fit;
  final double radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    child: CachedNetworkImage(
      imageUrl: src,
      fit: fit,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      placeholder: (context, url) =>
          AppSkeleton(width: width, height: height, radius: radius),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Theme.of(context).dividerColor,
        child: const Icon(Icons.image_not_supported_outlined),
      ),
    ),
  );
}
