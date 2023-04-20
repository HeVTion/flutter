import 'package:flutter/material.dart';
import 'package:untitled/util/AppUtils.dart';
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
      VideoPlayerController.network(AppUtil.videoUrl1),
      VideoPlayerController.network(AppUtil.videoUrl2),
      VideoPlayerController.network(AppUtil.videoUrl),
      VideoPlayerController.network(AppUtil.videoUrl1),
      VideoPlayerController.network(AppUtil.videoUrl2),
      VideoPlayerController.network(AppUtil.videoUrl),
      VideoPlayerController.network(AppUtil.videoUrl1),
      VideoPlayerController.network(AppUtil.videoUrl2),
      VideoPlayerController.network(AppUtil.videoUrl),
      VideoPlayerController.network(AppUtil.videoUrl1),
      VideoPlayerController.network(AppUtil.videoUrl2),
      VideoPlayerController.network(AppUtil.videoUrl),
      VideoPlayerController.network(AppUtil.videoUrl1),
      VideoPlayerController.network(AppUtil.videoUrl2),
    ];

    for (var controller in _videoControllers) {
      controller.initialize().then((_) {
        setState(() {});
        // 初始化后自动播放
        // controller.play();
      });
      controller.addListener(() {
        // 检查视频是否结束
        if (controller.value.position == controller.value.duration) {
          // 播放结束后，重新开始播放
          controller.seekTo(Duration.zero);
          controller.play();
        }
      });
    }

    _videoControllers[0].play();
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
      body: buildPageView(),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: _videoControllers.length,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
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
    );
  }

  void _onPageChanged(int index) {
    // 暂停所有视频
    for (var controller in _videoControllers) {
      controller.pause();
    }

    // 播放当前页面上的视频
    _videoControllers[index].play();
  }
}
