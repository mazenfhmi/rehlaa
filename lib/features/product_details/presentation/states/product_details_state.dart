import 'package:rehlaa/features/product_details/domain/entities/product_selection.dart';

class ProductDetailsState {
  const ProductDetailsState({
    required this.selection,
    this.quantity = 1,
    this.mediaIndex = 0,
  });

  final ProductSelection selection;
  final int quantity;
  final int mediaIndex;

  ProductDetailsState copyWith({
    ProductSelection? selection,
    int? quantity,
    int? mediaIndex,
  }) => ProductDetailsState(
    selection: selection ?? this.selection,
    quantity: quantity ?? this.quantity,
    mediaIndex: mediaIndex ?? this.mediaIndex,
  );
}
