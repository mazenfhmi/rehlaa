import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/home/domain/entities/home_category.dart';
import 'package:rehlaa/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_home_repository.g.dart';

/// Mock implementation of [HomeRepository] providing deterministic test data.
class MockHomeRepository implements HomeRepository {
  const MockHomeRepository();

  @override
  Future<Result<List<HomeCategory>>> getCategories() async {
    // Simulate slight network latency in dev/mock environment
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return const Success([
      HomeCategory(
        id: '1',
        titleAr: 'جميع البطاقات',
        titleEn: 'All Cards',
        svgIcon: 'assets/icons/Category.svg',
        isSelected: true,
      ),
      HomeCategory(
        id: '2',
        titleAr: 'الألعاب',
        titleEn: 'Gaming',
        svgIcon: 'assets/icons/Game.svg',
      ),
      HomeCategory(
        id: '3',
        titleAr: 'الهواتف',
        titleEn: 'Mobile',
        svgIcon: 'assets/icons/Call.svg',
      ),
      HomeCategory(
        id: '4',
        titleAr: 'برامج تعليمية',
        titleEn: 'Education',
        svgIcon: 'assets/icons/Document.svg',
      ),
      HomeCategory(
        id: '5',
        titleAr: 'أدوات برمجية',
        titleEn: 'Software',
        svgIcon: 'assets/icons/Setting.svg',
      ),
      HomeCategory(
        id: '6',
        titleAr: 'اشتراكات',
        titleEn: 'Subscriptions',
        svgIcon: 'assets/icons/Ticket.svg',
      ),
    ]);
  }
}

@riverpod
HomeRepository homeRepository(Ref ref) => const MockHomeRepository();
