import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:untitled/util/AppUtils.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late PageController _pageController;
  late List<VideoPlayerController> _videoControllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _videoControllers = [
      VideoPlayerController.network(AppUtil.videoUrl),
      VideoPlayerController.network(AppUtil.videoUrl),
      VideoPlayerController.network(AppUtil.videoUrl),
    ];

    for (var controller in _videoControllers) {
      controller.initialize().then((_) => setState(() {}));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _videoControllers.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final controller = _videoControllers[index];
          return controller.value.isInitialized
              ? GestureDetector(
            onTap: () {
              setState(() {
                controller.value.isPlaying
                    ? controller.pause()
                    : controller.play();
              });
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
