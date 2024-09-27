import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedShare extends StatefulWidget {
  const AnimatedShare({super.key});

  @override
  State<AnimatedShare> createState() => _AnimatedShareState();
}

class _AnimatedShareState extends State<AnimatedShare> {
  RxBool isExpanded = false.obs;

  void toggleButtons() {
    isExpanded.value= !isExpanded.value;

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animated Share UI'),
      ),
      body: Obx(()=>Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: isExpanded.value ? 110.0 : size.width / 2-25,
            bottom: isExpanded.value ? 85.0 : 0.0,
            child: AnimatedOpacity(
              opacity: isExpanded.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/linkedIn_logo.png',scale: 2)),
                  const Text('LinkedIn Post',style: TextStyle(fontSize: 10,color: Colors.black)),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isExpanded.value ? 110.0 : size.width / 2-25,
            bottom: isExpanded.value ? 85.0 : 0.0,
            child: AnimatedOpacity(
              opacity: isExpanded.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/insta.png', scale: 2)),
                  const Text('Insta Post',style: TextStyle(fontSize: 10,color: Colors.black)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: size.width/2-50,
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    toggleButtons();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black54,foregroundColor: Colors.white),
                  child: const Text('Share')),
            ),
          ),
        ],
      ),)
    );
  }
}
