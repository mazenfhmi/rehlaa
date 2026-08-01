import 'package:rehlaa/features/checkout/domain/entities/bank.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank_account.dart';
import 'package:rehlaa/features/checkout/domain/entities/payment_method.dart';

class CheckoutMockData {
  static const paymentMethods = [
    PaymentMethod(
      id: 'bravo',
      code: 'BRAVO',
      nameAr: 'براڤو',
      nameEn: 'Bravo',
      logoUrl: 'https://placehold.co/100x100/purple/white?text=Bravo',
      descriptionAr: 'ادفع باستخدام تطبيق براڤو',
      descriptionEn: 'Pay using Bravo app',
      isBankTransfer: false,
    ),
    PaymentMethod(
      id: 'cashil_pay',
      code: 'CASHIL_PAY',
      nameAr: 'كاشيل باي',
      nameEn: 'CashilPay',
      logoUrl: 'https://placehold.co/100x100/blue/white?text=CashilPay',
      descriptionAr: 'ادفع باستخدام محفظة كاشيل',
      descriptionEn: 'Pay using Cashil wallet',
      isBankTransfer: false,
    ),
    PaymentMethod(
      id: 'bank_transfer',
      code: 'BANK_TRANSFER',
      nameAr: 'تحويل بنكي',
      nameEn: 'Bank Transfer',
      logoUrl: 'https://placehold.co/100x100/grey/white?text=Bank',
      descriptionAr: 'تحويل مباشر لحسابنا البنكي',
      descriptionEn: 'Direct transfer to our bank account',
      isBankTransfer: true,
    ),
  ];

  static const banks = [
    Bank(
      id: 'bok',
      nameAr: 'بنك الخرطوم',
      nameEn: 'Bank of Khartoum',
      logoUrl: 'https://placehold.co/100x100/green/white?text=BOK',
    ),
    Bank(
      id: 'fib',
      nameAr: 'بنك فيصل الإسلامي',
      nameEn: 'Faisal Islamic Bank',
      logoUrl: 'https://placehold.co/100x100/teal/white?text=FIB',
    ),
    Bank(
      id: 'onb',
      nameAr: 'بنك أمدرمان الوطني',
      nameEn: 'Omdurman National Bank',
      logoUrl: 'https://placehold.co/100x100/navy/white?text=ONB',
    ),
    Bank(
      id: 'mb',
      nameAr: 'بنك النيلين',
      nameEn: 'Al Nilein Bank', // Just using MB placeholder from plan, let's say it's Al Nilein
      logoUrl: 'https://placehold.co/100x100/blue/white?text=MB',
    ),
  ];

  static const bankAccounts = [
    BankAccount(
      id: 'acc_bok',
      bankId: 'bok',
      beneficiaryNameAr: 'شركة رحلة',
      beneficiaryNameEn: 'Rehlaa Company',
      accountNumber: '8199246',
      instructionsAr: 'يرجى التحويل إلى هذا الحساب وإرفاق إيصال الدفع.',
      instructionsEn: 'Please transfer to this account and attach the receipt.',
    ),
    BankAccount(
      id: 'acc_fib',
      bankId: 'fib',
      beneficiaryNameAr: 'شركة رحلة',
      beneficiaryNameEn: 'Rehlaa Company',
      accountNumber: '12345678',
      instructionsAr: 'يرجى التحويل إلى هذا الحساب وإرفاق إيصال الدفع.',
      instructionsEn: 'Please transfer to this account and attach the receipt.',
    ),
    BankAccount(
      id: 'acc_onb',
      bankId: 'onb',
      beneficiaryNameAr: 'شركة رحلة',
      beneficiaryNameEn: 'Rehlaa Company',
      accountNumber: '987654321',
      instructionsAr: 'يرجى التحويل إلى هذا الحساب وإرفاق إيصال الدفع.',
      instructionsEn: 'Please transfer to this account and attach the receipt.',
    ),
    BankAccount(
      id: 'acc_mb',
      bankId: 'mb',
      beneficiaryNameAr: 'شركة رحلة',
      beneficiaryNameEn: 'Rehlaa Company',
      accountNumber: '55667788',
      instructionsAr: 'يرجى التحويل إلى هذا الحساب وإرفاق إيصال الدفع.',
      instructionsEn: 'Please transfer to this account and attach the receipt.',
    ),
  ];
}
