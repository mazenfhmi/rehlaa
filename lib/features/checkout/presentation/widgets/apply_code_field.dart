import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/components/buttons/app_buttons.dart';
import 'package:rehlaa/core/design_system/components/fields/app_fields.dart';

class ApplyCodeField extends StatefulWidget {
  const ApplyCodeField({
    required this.label,
    required this.hintText,
    required this.buttonText,
    required this.onApply,
    super.key,
    this.isLoading = false,
    this.errorText,
    this.appliedCode,
  });

  final String label;
  final String hintText;
  final String buttonText;
  final Future<void> Function(String code) onApply;
  final bool isLoading;
  final String? errorText;
  final String? appliedCode;

  @override
  State<ApplyCodeField> createState() => _ApplyCodeFieldState();
}

class _ApplyCodeFieldState extends State<ApplyCodeField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.appliedCode);
  }

  @override
  void didUpdateWidget(covariant ApplyCodeField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.appliedCode != oldWidget.appliedCode) {
      _controller.text = widget.appliedCode ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final code = _controller.text.trim();
    if (code.isNotEmpty) {
      widget.onApply(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasAppliedCode =
        widget.appliedCode != null && widget.appliedCode!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppTextField(
                controller: _controller,
                hint: widget.hintText,
                enabled: !widget.isLoading && !hasAppliedCode,
              ),
            ),
            const SizedBox(width: 12),
            AppPrimaryButton(
              width: 100,
              label: hasAppliedCode ? 'مُطبّق' : widget.buttonText,
              onPressed: (widget.isLoading || hasAppliedCode) ? null : _submit,
              isLoading: widget.isLoading,
            ),
          ],
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.errorText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
