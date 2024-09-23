import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  RxInt currentIndex = 0.obs;
  RxBool isInitialisedPlayer = false.obs;

  List<String> videoUrls = [
    "https://testapplication.in/aafm-demo/uploads/lesson_files/videos/18796be59ea4bff55b043b4045bf37c0.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
  ];

  Future<void> initializePlayer(String url) async {
    try {
      isInitialisedPlayer.value = false;
      if (videoPlayerController != null && videoPlayerController!.value.isInitialized) {
        videoPlayerController!.dispose();
      }
      if (chewieController != null) {
        chewieController!.dispose();
      }
      debugPrint('initialising start');
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));

      await videoPlayerController!.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        looping: false,
        autoInitialize: true,
        allowFullScreen: true,
        allowedScreenSleep: false,
        showOptions: true,
        showControlsOnInitialize: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            bufferedColor: Colors.grey,
            handleColor: Colors.red,
            backgroundColor: Colors.white),
        placeholder: Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );

      isInitialisedPlayer.value = true;

      videoPlayerController!.addListener(() async {
        if (videoPlayerController!.value.position.inSeconds ==
            videoPlayerController!.value.duration.inSeconds) {
          if (chewieController != null && chewieController!.isFullScreen) {
            // debugPrint('isFullScreen:${chewieController!.isFullScreen}');
            chewieController!.exitFullScreen();
          }
          playNextVideo();
        }
      });
      // update();
    } catch (e) {
      debugPrint('error:${e.toString()}');
    }
  }

  void playNextVideo() async {
    try {
      if (currentIndex.value < videoUrls.length - 1) {
        debugPrint('AutoIndex:${currentIndex.value}}');
        currentIndex.value++;
        debugPrint('AutoCurrentIndex:${currentIndex.value}}');
        await initializePlayer(videoUrls[currentIndex.value]);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void playSelectedVideo(int index) {
    try {
      if (chewieController != null && chewieController!.isPlaying) {
        chewieController!.pause();
      }
      debugPrint('PIndex:$index');
      currentIndex.value = index;
      debugPrint('currentIndex:$index}');
      initializePlayer(videoUrls[currentIndex.value]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void seekForward() {
    final currentPosition = videoPlayerController!.value.position;
    final targetPosition = currentPosition + const Duration(seconds: 10);
    videoPlayerController!.seekTo(targetPosition);
  }

  void seekBackward() {
    final currentPosition = videoPlayerController!.value.position;
    final targetPosition = currentPosition - const Duration(seconds: 10);
    videoPlayerController!.seekTo(targetPosition);
  }

  @override
  void onClose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.onClose();
  }
}

/*  void autoHideMethod(){
    debounce(showIcon, (_) {
      showIcon.value = false;
    }, time: const Duration(seconds: 3));
  }*/
/*
  void toggleControls() {
    debugPrint('showIv:${showIcon.value}');
    showIcon.value = true;
    debugPrint('showIconv:${showIcon.value}');
  }*/

/*List<Map<String, String>> videoQualities = [
    {
      '480p': 'https://www.example.com/video1_480p.mp4',
      '720p': 'https://www.example.com/video1_720p.mp4',
      '1080p': 'https://www.example.com/video1_1080p.mp4',
    },
    {
      '480p': 'https://www.example.com/video2_480p.mp4',
      '720p': 'https://www.example.com/video2_720p.mp4',
      '1080p': 'https://www.example.com/video2_1080p.mp4',
    },
    {
      '480p': 'https://www.example.com/video3_480p.mp4',
      '720p': 'https://www.example.com/video3_720p.mp4',
      '1080p': 'https://www.example.com/video3_1080p.mp4',
    },
  ];

  String currentQuality = '720p'; // Default quality
*/

/* void changeVideoQuality(String quality) {
    currentQuality = quality;
    String newUrl = videoQualities[currentIndex.value][quality]!;
    videoPlayerController.pause(); // Pause the video
    _initializePlayer(newUrl); // Reinitialize with the new quality URL
  }
*/
