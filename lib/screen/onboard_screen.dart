import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/screen/home_page.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              _currentIndex = index;
              setState(() {});
            },
            children: [
              buildPage(
                  'DOCTOR',
                  'One way to announce or promote a certain new product or special',
                  'assets/doctor.png'),
              buildPage(
                  'ONLINE PAYMENT',
                  'I know how to terrible it can be for you at night and even',
                  'assets/payment.png'),
              buildPage(
                  'APPOINTMENT',
                  'Kidney stone are very hard mineral deposits that happen to form',
                  'assets/appointment.png')
            ],
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 14 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            _currentIndex == index ? 4 : 10),
                        color: _currentIndex == index
                            ? Colors.green
                            : Colors.grey),
                  );
                }),
              )),
          Positioned(
              bottom: 30,
              right: 10,
              child: TextButton(
                  onPressed: () {
                    if(_currentIndex==2){
                      Get.to(()=>const HomePage());
                    }else{
                      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    }
                  },
                  child: Text(
                    _currentIndex == 2 ? "Get Started" : "Next",
                    style: const TextStyle(color: Colors.green, fontSize: 16),
                  )))
        ],
      ),
    );
  }

  Widget buildPage(String title, String body, String image) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, scale: 0.5),
            const SizedBox(height: 100),
            Text(title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Text(
              body,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ));
  }
}
