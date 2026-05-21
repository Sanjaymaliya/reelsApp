import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelsapps/extensions/app_extensions.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../data/models/reel_model.dart';
import '../bloc/reels_bloc.dart';

class ReelItemWidget extends StatefulWidget {
  final ReelModel reel;

  const ReelItemWidget({super.key, required this.reel});

  @override
  State<ReelItemWidget> createState() => _ReelItemWidgetState();
}

class _ReelItemWidgetState extends State<ReelItemWidget> {
  late VideoPlayerController videoController;

  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    /// OFFLINE VIDEO
    if (widget.reel.localVideo != null) {
      videoController = VideoPlayerController.file(File(widget.reel.localVideo!));
    } else {
      /// ONLINE VIDEO
      videoController = VideoPlayerController.networkUrl(Uri.parse(widget.reel.videoUrl));
    }

    await videoController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoController,

      autoPlay: true,

      looping: true,

      showControls: false,
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    chewieController?.dispose();

    videoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!videoController.value.isInitialized) {
      return CachedNetworkImage(
        imageUrl: widget.reel.thumbnailUrl,
        width:double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.person, size: 50,),
      );
    }

    return Stack(
      fit: StackFit.expand,

      children: [
        FittedBox(
          fit: BoxFit.cover,

          child: SizedBox(
            width: videoController.value.size.width,

            height: videoController.value.size.height,

            child: Chewie(controller: chewieController!),
          ),
        ),

        Positioned(
          top: 20,
          left: 0,
          right: 0,

          child: VideoProgressIndicator(
            videoController,

            allowScrubbing: true,

            colors: const VideoProgressColors(
              playedColor: Colors.red,

              bufferedColor: Colors.white30,

              backgroundColor: Colors.white12,
            ),
          ),
        ),

        Positioned(bottom: 60, left: 16, child: Text(widget.reel.title)),

        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            children: [
              BlocConsumer<ReelsBloc, ReelsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                  return AppIconButton(
                    icon: widget.reel.isLiked ? Icons.favorite : Icons.favorite_border,

                    label: '${widget.reel.likes}',

                    color: widget.reel.isLiked ? Colors.red : Colors.white,

                    onTap: () {

                      context
                          .read<ReelsBloc>()
                          .add(
                        OnTapLike(
                          widget.reel.id,
                        ),
                      );
                    },
                  );
                }
              ),
              addVerticalSpace(10),
              AppIconButton(
                icon: Icons.share,

                label: 'Share',

                color: Colors.white,

                onTap: () async {
                  await shareImageAndText(widget.reel.title, widget.reel.thumbnailUrl);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
