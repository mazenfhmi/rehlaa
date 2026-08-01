import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/home/domain/entities/home_category.dart';

/// Repository contract for Home feature.
abstract interface class HomeRepository {
  /// Fetches the list of home categories.
  Future<Result<List<HomeCategory>>> getCategories();
}
