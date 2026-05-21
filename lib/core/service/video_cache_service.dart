
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VideoCacheService {
  Future<String?> cacheVideo(String url) async {
    try {
      final file = await DefaultCacheManager().getSingleFile(url);

      return file.path;
    } catch (e) {
      return null;
    }
  }
}
