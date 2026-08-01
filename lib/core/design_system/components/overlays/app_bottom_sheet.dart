import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_spacing.dart';

class AppModalHandle extends StatelessWidget {
  const AppModalHandle({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: 48,
    height: 4,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(AppSpacing.xs),
    ),
  );
}

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.sm),
          const Center(child: AppModalHandle()),
          const SizedBox(height: AppSpacing.sm),
          Padding(padding: padding, child: child),
        ],
      ),
    ),
  );
}

Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
}) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: isScrollControlled,
  useRootNavigator: useRootNavigator,
  backgroundColor: Colors.transparent,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
  ),
  builder: (context) => AppBottomSheet(
    padding: EdgeInsets
        .zero, // The builder will provide its own padding or use DraggableScrollableSheet
    child: builder(context),
  ),
);
