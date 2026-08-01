import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rehlaa/core/design_system/components/buttons/app_buttons.dart';
import 'package:rehlaa/core/design_system/components/fields/app_fields.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:rehlaa/features/checkout/data/repositories/mock_checkout_repository.dart';
import 'package:rehlaa/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:rehlaa/features/checkout/presentation/widgets/checkout_sheet.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class MockConnectivityService implements ConnectivityService {
  @override
  Future<bool> get isConnected async => true;
  
  @override
  Stream<bool> get onConnectivityChanged => Stream.value(true);
}

void main() {
  testWidgets('product checkout flow integration test', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    const testPrice = Money.sdg(500000); // 5,000 SDG

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          preferenceStorageServiceProvider.overrideWithValue(
            PreferenceStorageService(prefs),
          ),
          checkoutRepositoryProvider.overrideWithValue(MockCheckoutRepository(delay: Duration.zero)),
          connectivityServiceProvider.overrideWithValue(MockConnectivityService()),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    showCheckoutSheet(context, price: testPrice);
                  },
                  child: const Text('Open Checkout'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Open sheet
    await tester.tap(find.text('Open Checkout'));
    await tester.pumpAndSettle();

    // Verify sheet opened
    expect(find.text('الدفع'), findsOneWidget);
    
    // Tap bank transfer
    final bankTransferFinder = find.text('تحويل بنكي');
    await tester.ensureVisible(bankTransferFinder);
    await tester.tap(bankTransferFinder);
    await tester.pumpAndSettle();

    // Verify banks are shown
    expect(find.text('بنك الخرطوم'), findsOneWidget);
    
    // Tap bank
    final bankFinder = find.text('بنك الخرطوم');
    await tester.ensureVisible(bankFinder);
    await tester.tap(bankFinder);
    await tester.pumpAndSettle();

    // Scroll to see the coupon field
    final couponFinder = find.byType(AppTextField);
    await tester.dragUntilVisible(
      couponFinder,
      find.byType(ListView),
      const Offset(0, -100),
    );
    await tester.enterText(couponFinder, 'WELCOME50');
    
    final applyFinder = find.text('تطبيق');
    await tester.tap(applyFinder);
    await tester.pumpAndSettle();

    // Tap submit button (fails because no receipt)
    final submitFinder = find.widgetWithText(AppPrimaryButton, 'تأكيد الدفع');
    await tester.tap(submitFinder);
    await tester.pumpAndSettle();

    // Switch to Cashil Pay
    final cashilFinder = find.text('كاشيل باي');
    await tester.dragUntilVisible(
      cashilFinder,
      find.byType(ListView),
      const Offset(0, 100), // scroll up
    );
    await tester.tap(cashilFinder);
    await tester.pumpAndSettle();

    // Tap submit button again (now succeeds)
    await tester.tap(submitFinder);
    await tester.pumpAndSettle();

    // Verify sheet is dismissed
    expect(find.text('الدفع'), findsNothing);
  });
}
