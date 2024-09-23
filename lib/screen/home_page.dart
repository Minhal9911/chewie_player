import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/screen/video_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const VideoPlayerWidget());
        },
        child: const Text('Video Player'),
      ),
    );
  }
}
