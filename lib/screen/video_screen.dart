import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/controller/chewie_controller.dart';
import 'package:poc_flutter/widgets/chewie_player.dart';

class MyCourseDetail extends StatefulWidget {
  const MyCourseDetail({super.key});

  @override
  State<MyCourseDetail> createState() => _MyCourseDetailState();
}

class _MyCourseDetailState extends State<MyCourseDetail> {
  final controller = Get.put(VideoController());

  @override
  void initState() {
    super.initState();
    controller
        .initializePlayer(controller.videoUrls[controller.currentIndex.value]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
                height: 220,
                width: size.width,
                child: const ChewiePlayer()),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.videoUrls.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Video ${index + 1}'),
                    onTap: () {
                      controller.playSelectedVideo(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomControls extends StatelessWidget {
  final ChewieController chewieController;

  const CustomControls({
    super.key,
    required this.chewieController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10, color: Colors.white),
              onPressed: () {
                controller.seekBackward();
              },
            ),
            IconButton(
              icon: chewieController.isPlaying
                  ? const Icon(Icons.pause, color: Colors.white)
                  : const Icon(Icons.play_arrow, color: Colors.white),
              onPressed: () {
                if (chewieController.isPlaying) {
                  chewieController.videoPlayerController.pause();
                } else {
                  chewieController.videoPlayerController.play();
                }
                chewieController.notifyListeners();
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_10, color: Colors.white),
              onPressed: () {
                controller.seekForward();
              },
            ),
          ],
        ),
      ],
    );
  }
}
