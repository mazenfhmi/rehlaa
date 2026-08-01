import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// Feedback components — loading, empty, error, async builder
// ---------------------------------------------------------------------------

/// Centered loading indicator using the primary color.
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 2.5,
        color: AppColors.primary,
      ),
    ),
  );
}

// ---------------------------------------------------------------------------

/// Empty state with icon, title, and optional action button.
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    required this.title,
    super.key,
    this.subtitle,
    this.icon,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.xxxl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.inbox_outlined,
            size: 72,
            color: Theme.of(context).dividerColor,
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
          if (onAction != null && actionLabel != null) ...[
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

// ---------------------------------------------------------------------------

/// Error state with retry button.
class AppErrorState extends StatelessWidget {
  const AppErrorState({
    required this.message,
    super.key,
    this.onRetry,
    this.retryLabel = 'Try Again',
  });

  final String message;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.xxxl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 72,
            color: AppColors.error,
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onRetry,
                child: Text(retryLabel),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

// ---------------------------------------------------------------------------

/// AsyncValue builder that handles loading / error / data states.
/// Works with Riverpod's AsyncValue<T>.
class AppAsyncBuilder<T> extends StatelessWidget {
  const AppAsyncBuilder({
    required this.value,
    required this.data,
    super.key,
    this.loading,
    this.error,
    this.skeleton,
  });

  /// The AsyncValue to observe.
  final AsyncValue<T> value;

  /// Builder for the success state.
  final Widget Function(T data) data;

  /// Custom loading widget (defaults to [AppLoadingIndicator]).
  final Widget? loading;

  /// Custom error widget (defaults to [AppErrorState]).
  final Widget Function(Object error, StackTrace? stack)? error;

  /// Optional skeleton to show instead of spinner.
  final Widget? skeleton;

  @override
  Widget build(BuildContext context) => value.when(
    data: data,
    loading: () => skeleton ?? loading ?? const AppLoadingIndicator(),
    error: (e, st) =>
        error?.call(e, st) ?? AppErrorState(message: e.toString()),
  );
}

// ---------------------------------------------------------------------------
// Status badge — matching reference design
// ---------------------------------------------------------------------------

enum AppBadgeStatus { pending, processing, completed, cancelled, info }

class AppStatusBadge extends StatelessWidget {
  const AppStatusBadge({
    required this.label,
    super.key,
    this.status = AppBadgeStatus.info,
  });

  final String label;
  final AppBadgeStatus status;

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor) = switch (status) {
      AppBadgeStatus.pending => (
        AppColors.warning.withValues(alpha: 0.15),
        AppColors.warning,
      ),
      AppBadgeStatus.processing => (
        AppColors.info.withValues(alpha: 0.15),
        AppColors.info,
      ),
      AppBadgeStatus.completed => (
        AppColors.success.withValues(alpha: 0.15),
        AppColors.success,
      ),
      AppBadgeStatus.cancelled => (
        AppColors.error.withValues(alpha: 0.15),
        AppColors.error,
      ),
      AppBadgeStatus.info => (
        AppColors.primary.withValues(alpha: 0.12),
        AppColors.primary,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          fontFamily: 'PlusJakarta',
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Dot page indicator — from .desgin-ui/lib/components/dot_indicators.dart
// ---------------------------------------------------------------------------

class AppDotIndicator extends StatelessWidget {
  const AppDotIndicator({
    required this.isActive,
    super.key,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.black20,
  });

  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: AppDurations.normal,
    margin: const EdgeInsets.symmetric(horizontal: 3),
    height: isActive ? 6 : 4,
    width: isActive ? 20 : 4,
    decoration: BoxDecoration(
      color: isActive ? activeColor : inactiveColor,
      borderRadius: BorderRadius.circular(AppRadius.full),
    ),
  );
}

class AppDotsIndicator extends StatelessWidget {
  const AppDotsIndicator({
    required this.count,
    required this.currentIndex,
    super.key,
    this.activeColor = AppColors.primary,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      count,
      (i) => AppDotIndicator(
        isActive: i == currentIndex,
        activeColor: activeColor,
      ),
    ),
  );
}
