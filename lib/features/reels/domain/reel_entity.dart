class ReelEntity {
  final int id;
  final String title;
  final String videoUrl;
  final String thumbnailUrl;
  final int likes;
  bool isLiked;

  ReelEntity({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.likes,
    required this.isLiked,
  });
}