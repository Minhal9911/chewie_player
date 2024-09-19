import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/controller/chewie_controller.dart';

class ChewiePlayer extends StatefulWidget {
  const ChewiePlayer({super.key});

  @override
  State<ChewiePlayer> createState() => _ChewiePlayerState();
}

class _ChewiePlayerState extends State<ChewiePlayer> {
  final controller = Get.find<VideoController>();

  @override
  void initState() {
    super.initState();
    // controller.autoHideMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isInitialisedPlayer.value) {
        return Chewie(controller: controller.chewieController!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
/*       Obx(() => controller.showIcon.value
                ? Positioned(
                    top: 4,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox.shrink())*/