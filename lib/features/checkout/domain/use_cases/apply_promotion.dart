import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class ApplyPromotion {
  /// Simple mock promotion validation
  Result<Money> call({required String code}) {
    final cleanCode = code.trim().toUpperCase();
    
    if (cleanCode == 'SAVE10K') {
      return const Success(Money.sdg(1000000)); // 10,000 SDG discount
    }
    
    if (cleanCode == 'REF-A1B2C3') {
      return const Success(Money.sdg(500000)); // 5,000 SDG discount
    }
    
    return const Failure(ValidationFailure(message: 'Invalid or expired code'));
  }
}
