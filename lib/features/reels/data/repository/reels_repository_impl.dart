import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../core/service/video_cache_service.dart';
import '../../domain/reel_entity.dart';
import '../datasource/reels_local_datasource.dart';
import '../datasource/reels_remote_datasource.dart';
import '../models/reel_model.dart';

class ReelsRepositoryImpl {
  final ReelsRemoteDataSource remote;

  final ReelsLocalDataSource local;

  final cacheService = VideoCacheService();

  ReelsRepositoryImpl({required this.remote, required this.local});

  Future<List<ReelEntity>> getReels() async {
    final result = await Connectivity().checkConnectivity();

    final hasInternet = result != ConnectivityResult.none;

    /// ONLINE
    if (hasInternet) {

      final reels = await remote.getReels();

      final updatedReels = <ReelModel>[];

      for (final reel in reels) {
        final localVideo = await cacheService.cacheVideo(reel.videoUrl);

        updatedReels.add(
          reel.copyWith(localVideo: localVideo, viewedAt: DateTime.now().toString()),
        );
      }

      await local.cacheReels(updatedReels);

      return updatedReels;
    }

    /// OFFLINE
    return await local.getCachedReels();
  }
}
