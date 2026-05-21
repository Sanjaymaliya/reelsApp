

import '../../domain/reel_entity.dart';

class ReelModel extends ReelEntity {

  final String? localVideo;

  final String viewedAt;

  ReelModel({
    required super.id,
    required super.title,
    required super.videoUrl,
    required super.thumbnailUrl,
    required super.likes,
    required this.viewedAt,
    this.localVideo,
    required super.isLiked,
  });

  factory ReelModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ReelModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      likes: json['likes'],
      viewedAt: json['viewedAt'] ?? '',
      localVideo: json['localVideo'],
      isLiked: json['isLiked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'likes': likes,
      'viewedAt': viewedAt,
      'localVideo': localVideo,
      'isLiked': isLiked,
    };
  }

  ReelModel copyWith({
    String? localVideo,
    String? viewedAt,
  }) {
    return ReelModel(
      id: id,
      title: title,
      videoUrl: videoUrl,
      thumbnailUrl: thumbnailUrl,
      likes: likes,
      viewedAt:
      viewedAt ?? this.viewedAt,
      localVideo:
      localVideo ?? this.localVideo, isLiked: isLiked,
    );
  }
}