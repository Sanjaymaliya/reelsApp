import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/reel_model.dart';

class ReelsRemoteDataSource {
  Future<List<ReelModel>> getReels() async {
    final jsonString = await rootBundle.loadString('assets/mock/reels.json');

    final data = jsonDecode(jsonString);

    return data
        .map<ReelModel>(
          (e) => ReelModel(
            id: e['id'],
            title: e['title'],
            videoUrl: e['videoUrl'],
            thumbnailUrl: e['thumbnailUrl'],
            likes: e['likes'],
            isLiked: e['isLiked'],
            viewedAt: '',
          ),
        )
        .toList();
  }
}
