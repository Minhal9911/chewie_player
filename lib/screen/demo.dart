import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  // Trigger to expand/collapse buttons
  void toggleButtons() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animated Share UI'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: isExpanded ? 110.0 : size.width / 2-25,
            bottom: isExpanded ? 85.0 : 0.0,
            child: AnimatedOpacity(
              opacity: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/linkedIn_logo.png',scale: 1.9)),
                  const Text('LinkedIn Post',style: TextStyle(fontSize: 12,color: Colors.black)),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isExpanded ? 110.0 : size.width / 2-25,
            bottom: isExpanded ? 85.0 : 0.0,
            child: AnimatedOpacity(
              opacity: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/insta.png', scale: 1.9)),
                  const Text('Insta Post',style: TextStyle(fontSize: 12,color: Colors.black)),
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
      ),
    );
  }
}
