import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/controller/intro_controller.dart';
import 'package:poc_flutter/screen/home_page.dart';


// By using TabPageSelector
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(IntroController());

  @override
  void initState() {
    super.initState();
    controller.pageController = PageController(initialPage: 0);
    controller.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.setPageIndex(index);
              controller.setTabIndex(index);
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
              bottom: 20,
              left: 0,
              right: 0,
              child: Obx(()=>Center(
                child: controller.currentPageIndex == 2
                    ? buildButton()
                    : TabPageSelector(
                  controller: controller.tabController,
                  selectedColor: Colors.green,
                  color: Colors.grey,
                  borderStyle: BorderStyle.none,
                  indicatorSize: 16,
                ),
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

Widget buildButton() {
  return ElevatedButton(
      onPressed: () {
        Get.to(() => const HomePage());
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, foregroundColor: Colors.white),
      child: const Text('GET STARTED'));
}
