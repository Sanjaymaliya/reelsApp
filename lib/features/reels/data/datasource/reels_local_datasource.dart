import 'package:hive/hive.dart';

import '../models/reel_model.dart';

class ReelsLocalDataSource {
  Future<void> cacheReels(List<ReelModel> reels) async {
    final box = await Hive.openBox('reelsBox');

    await box.put('reels', reels.map((e) => e.toJson()).toList());
  }

  Future<List<ReelModel>> getCachedReels() async {
    final box = await Hive.openBox('reelsBox');

    final data = box.get('reels', defaultValue: []);

    return List<Map<String, dynamic>>.from(data).map((e) => ReelModel.fromJson(e)).toList();
  }
}
