import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/navigation/app_route_names.dart';
import '../../../../core/validation/validators.dart';
import '../view_models/login_view_model.dart';

/// Sign-in page matching `.desgin-ui/lib/screens/auth/views/login_screen.dart`.
class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(signInViewModelProvider.notifier).signIn(
          email: _emailController.text,
          password: _passwordController.text,
        );

    if (success && mounted) {
      context.go(AppRoutePaths.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInViewModelProvider);
    final isLoading = signInState.isLoading;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image from assets (design reference)
            Image.asset(
              'assets/images/login_dark.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 220,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 220,
                color: AppColors.primary,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.lock_outline_rounded,
                  size: 64,
                  color: AppColors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppSpacing.base),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Log in with your credentials to continue.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.xl),

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

                    Align(
                      alignment: Alignment.centerRight,
                      child: AppSecondaryButton(
                        label: 'Forgot password?',
                        onPressed: () => context.push(AppRoutePaths.forgotPassword),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // Error Message display
                    if (signInState.hasError) ...[
                      Text(
                        signInState.error.toString(),
                        style: const TextStyle(color: AppColors.error, fontSize: 13),
                      ),
                      const SizedBox(height: AppSpacing.base),
                    ],

                    // Sign In Button
                    AppPrimaryButton(
                      label: 'Log In',
                      isLoading: isLoading,
                      onPressed: _submit,
                    ),
                    const SizedBox(height: AppSpacing.base),

                    // Google Sign In
                    AppOutlinedButton(
                      label: 'Continue with Google',
                      svgIcon: 'assets/icons/Google.svg',
                      onPressed: isLoading
                          ? null
                          : () async {
                              final success = await ref
                                  .read(signInViewModelProvider.notifier)
                                  .signInWithGoogle();
                              if (success && mounted) {
                                context.go(AppRoutePaths.home);
                              }
                            },
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        AppSecondaryButton(
                          label: 'Sign up',
                          onPressed: () => context.push(AppRoutePaths.signUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
