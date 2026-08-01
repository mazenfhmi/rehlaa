import 'package:flutter/material.dart';

import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// Skeleton / shimmer loading states
// Adapted from .desgin-ui/lib/components/skleton/skelton.dart
// ---------------------------------------------------------------------------

/// A rectangular shimmer-style loading placeholder.
class AppSkeleton extends StatefulWidget {
  const AppSkeleton({
    super.key,
    this.height,
    this.width,
    this.radius = AppRadius.md,
    this.layer = 1,
  });

  final double? height;
  final double? width;
  final double radius;

  /// Controls opacity layering (1 = subtle, higher = more visible).
  final int layer;

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.04 * widget.layer,
      end: 0.10 * widget.layer,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _animation,
    builder: (context, child) => Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).iconTheme.color!.withValues(alpha: _animation.value),
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      ),
    ),
  );
}

/// A circular skeleton placeholder for avatars.
class AppCircleSkeleton extends StatelessWidget {
  const AppCircleSkeleton({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) => Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      color: Theme.of(context).iconTheme.color!.withValues(alpha: 0.06),
      shape: BoxShape.circle,
    ),
  );
}

/// A full-width skeleton line for text placeholders.
class AppSkeletonLine extends StatelessWidget {
  const AppSkeletonLine({super.key, this.width, this.height = 14});

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) =>
      AppSkeleton(width: width, height: height, radius: AppRadius.sm);
}
