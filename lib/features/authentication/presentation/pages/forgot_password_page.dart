import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/validation/validators.dart';
import '../../data/providers/auth_providers.dart';

/// Password recovery page matching `.desgin-ui/lib/screens/auth/views/password_recovery_screen.dart`.
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isSent = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.requestPasswordReset(_emailController.text);

    setState(() {
      _isLoading = false;
      _isSent = result.isSuccess;
      if (result.isFailure) {
        _errorMessage = result.failure.message;
      }
    });
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppPageHeader(title: 'Password Recovery'),
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: _isSent
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mark_email_read_outlined,
                        size: 72,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: AppSpacing.base),
                      Text(
                        'Recovery email sent!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Please check your inbox for instructions to reset your password.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      AppPrimaryButton(
                        label: 'Back to Sign In',
                        onPressed: () => context.pop(),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Enter your email address and we will send you a recovery link.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      AppTextField(
                        controller: _emailController,
                        label: 'Email',
                        hint: 'user@rehlaa.com',
                        prefixSvgIcon: 'assets/icons/Message.svg',
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      if (_errorMessage != null) ...[
                        Text(
                          _errorMessage!,
                          style: const TextStyle(
                            color: AppColors.error,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.base),
                      ],

                      AppPrimaryButton(
                        label: 'Send Recovery Email',
                        isLoading: _isLoading,
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
        ),
      );
}
