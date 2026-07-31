import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/navigation/app_route_names.dart';
import '../../../../core/validation/validators.dart';
import '../../data/providers/auth_providers.dart';
import '../view_models/auth_session_controller.dart';

/// Sign-up page matching `.desgin-ui/lib/screens/auth/views/signup_screen.dart`.
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() => _isLoading = false);

    result.fold(
      onSuccess: (session) {
        ref.read(authSessionControllerProvider.notifier).setSession(session);
        if (mounted) context.go(AppRoutePaths.home);
      },
      onFailure: (failure) {
        setState(() => _errorMessage = failure.message);
      },
    );
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: const AppPageHeader(title: 'Sign Up'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Please enter your details to register.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xl),

                // Name Field
                AppTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  hint: 'Mazen Ahmed',
                  prefixSvgIcon: 'assets/icons/Profile.svg',
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Please enter your name' : null,
                ),
                const SizedBox(height: AppSpacing.base),

                // Email Field
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'user@rehlaa.com',
                  prefixSvgIcon: 'assets/icons/Message.svg',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                ),
                const SizedBox(height: AppSpacing.base),

                // Password Field
                AppPasswordField(
                  controller: _passwordController,
                  validator: validatePassword,
                ),
                const SizedBox(height: AppSpacing.xl),

                if (_errorMessage != null) ...[
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: AppColors.error, fontSize: 13),
                  ),
                  const SizedBox(height: AppSpacing.base),
                ],

                // Sign Up Button
                AppPrimaryButton(
                  label: 'Sign Up',
                  isLoading: _isLoading,
                  onPressed: _submit,
                ),
                const SizedBox(height: AppSpacing.base),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    AppSecondaryButton(
                      label: 'Log in',
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
