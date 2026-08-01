import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/components/buttons/app_buttons.dart';
import 'package:rehlaa/core/design_system/components/overlays/app_bottom_sheet.dart';
import 'package:rehlaa/core/design_system/tokens/app_colors.dart';
import 'package:rehlaa/features/checkout/presentation/view_models/checkout_view_model.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/apply_code_field.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/bank_details_card.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/bank_selector_tile.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/payment_method_tile.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/price_summary.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/receipt_uploader.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

Future<void> showCheckoutSheet(BuildContext context, {required Money price}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CheckoutSheet(price: price),
    );

class CheckoutSheet extends ConsumerWidget {
  const CheckoutSheet({required this.price, super.key});

  final Money price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutViewModelProvider(price));
    final viewModel = ref.read(checkoutViewModelProvider(price).notifier);

    // Error handling listener
    ref.listen(
      checkoutViewModelProvider(price).select((s) => s.submissionError),
      (prev, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
    );

    // Success listener
    ref.listen(checkoutViewModelProvider(price).select((s) => s.isSuccess), (
      prev,
      next,
    ) {
      if (next == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم تأكيد الطلب بنجاح'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.of(context).pop();
      }
    });

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                const Center(child: AppModalHandle()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Text(
                    'الدفع',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 120,
                    ),
                    children: [
                      // Payment Methods
                      Text(
                        'طريقة الدفع',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (state.isLoading && state.paymentMethods.isEmpty)
                        const Center(child: CircularProgressIndicator())
                      else
                        ...state.paymentMethods.map(
                          (method) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: PaymentMethodTile(
                              method: method,
                              isSelected:
                                  state.selectedPaymentMethod?.id == method.id,
                              onTap: () =>
                                  viewModel.selectPaymentMethod(method.id),
                            ),
                          ),
                        ),

                      // Bank Transfer Details
                      if (state.selectedPaymentMethod?.isBankTransfer ==
                          true) ...[
                        const SizedBox(height: 24),
                        Text(
                          'اختر البنك',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        ...state.banks.map(
                          (bank) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: BankSelectorTile(
                              bank: bank,
                              isSelected: state.selectedBank?.id == bank.id,
                              onTap: () => viewModel.selectBank(bank.id),
                            ),
                          ),
                        ),

                        if (state.selectedBank != null &&
                            state.bankAccount != null) ...[
                          const SizedBox(height: 24),
                          BankDetailsCard(account: state.bankAccount!),
                          const SizedBox(height: 24),
                          ReceiptUploader(
                            selectedFile: state.receiptFile,
                            onFilePicked: viewModel.setReceipt,
                          ),
                        ],
                      ],

                      const SizedBox(height: 32),

                      // Apply Code
                      ApplyCodeField(
                        label: 'كوبون الخصم',
                        hintText: 'أدخل كود الخصم',
                        buttonText: 'تطبيق',
                        isLoading: state.isLoading,
                        errorText: state.couponError,
                        appliedCode: state.couponCode,
                        onApply: (code) async => viewModel.applyCoupon(code),
                      ),

                      const SizedBox(height: 32),

                      // Wallet Switch
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.black5,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: SwitchListTile(
                            title: const Text('استخدام رصيد المحفظة'),
                            subtitle: const Text('الرصيد المتاح: 50,000 SDG'),
                            value: state.useWallet,
                            onChanged: (val) => viewModel.toggleWallet(),
                            activeThumbColor: AppColors.primary,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Price Summary
                      if (state.quote != null)
                        PriceSummary(quote: state.quote!),
                    ],
                  ),
                ),
              ],
            ),

            // Sticky Bottom Button
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: AppPrimaryButton(
                  label: 'تأكيد الدفع',
                  isLoading: state.isSubmitting,
                  onPressed: state.isSubmitting ? null : viewModel.submit,
                ),
              ),
            ),
          ],
        ), // End of Stack
      ), // End of DecoratedBox
    ); // End of DraggableScrollableSheet
  }
}
