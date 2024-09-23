import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/controller/chewie_controller.dart';

class ChewiePlayer extends StatelessWidget {
  const ChewiePlayer({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoController>();
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