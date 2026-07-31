import '../../../../core/result/result.dart';
import '../entities/home_category.dart';

/// Repository contract for Home feature.
abstract interface class HomeRepository {
  /// Fetches the list of home categories.
  Future<Result<List<HomeCategory>>> getCategories();
}
