import 'dart:convert';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CatalogLocalDataSource {
  Future<void> cacheHomeFeed(HomeFeed feed);
  Future<HomeFeed?> getCachedHomeFeed();
}

class CatalogLocalDataSourceImpl implements CatalogLocalDataSource {
  final SharedPreferences _prefs;
  
  static const _homeFeedKey = 'CACHED_HOME_FEED';

  CatalogLocalDataSourceImpl(this._prefs);

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
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        return HomeFeed.fromJson(jsonMap).copyWith(isStale: true);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
