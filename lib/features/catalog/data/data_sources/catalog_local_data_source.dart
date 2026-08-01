import 'dart:convert';

import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';

abstract class CatalogLocalDataSource {
  Future<void> cacheHomeFeed(HomeFeed feed);
  Future<HomeFeed?> getCachedHomeFeed();
}

class CatalogLocalDataSourceImpl implements CatalogLocalDataSource {
  CatalogLocalDataSourceImpl(this._prefs);
  final PreferenceStorageService _prefs;

  static const _homeFeedKey = 'CACHED_HOME_FEED';

  @override
  Future<void> cacheHomeFeed(HomeFeed feed) async {
    final jsonString = json.encode(feed.toJson());
    await _prefs.setString(_homeFeedKey, jsonString);
  }

  @override
  Future<HomeFeed?> getCachedHomeFeed() async {
    final jsonString = _prefs.getString(_homeFeedKey);
    if (jsonString != null) {
      try {
        final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
        return HomeFeed.fromJson(jsonMap).copyWith(isStale: true);
      } on FormatException {
        return null;
      }
    }
    return null;
  }
}
