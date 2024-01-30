import 'package:flutter/material.dart';
import 'package:petapp/Screens/firebase/user_auth/login_page.dart';
import 'package:petapp/Screens/onboarding_screens/intro_page_four.dart';
import 'package:petapp/Screens/onboarding_screens/intro_page_one.dart';
import 'package:petapp/Screens/onboarding_screens/intro_page_three.dart';
import 'package:petapp/Screens/onboarding_screens/intro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool _onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _onLastPage = (index == 3); // Check if on last page
              });
            },
            children: [
              PageOne(),
              PageTwo(),
              PageThree(),
              PageFour(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const JumpingDotEffect(
                      activeDotColor: Colors.white,
                      dotColor: Color.fromARGB(255, 12, 202, 255),
                    ),
                  ),
                  // next or done
                  _onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const LoginPage()),
                              ),
                            );
                          },
                          child: const Text(
                            "DONE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text(
                            "NEXT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
