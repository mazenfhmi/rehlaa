import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'product_selection.freezed.dart';

@freezed
abstract class ProductSelection with _$ProductSelection {
  const factory ProductSelection({
    required Set<String> optionValueIds,
    required String optionSignature,
    required Money resolvedPrice,
    required bool isComplete,
    required int selectedRequiredCount,
  }) = _ProductSelection;
}
