import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:petapp/Screens/onboarding_screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 16, 24, 177),
                    Color.fromARGB(255, 143, 145, 186),
                  ],
                ),
              ),
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.5, // Limit the height of the animation
                    child: Container(
                      child: Lottie.asset(
                        'assets/full.json',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20, // Adjust the height as needed
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.7, // Set the width of the percentage container
                    child: LinearPercentIndicator(
                      lineHeight: 10,
                      percent: 1, // Adjust the percentage as needed
                      progressColor: Colors.amber, // Color of the indicator
                      backgroundColor:
                          Colors.purple[100], // Color of the background
                      animation: true,
                      animationDuration: 4000,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust the space above the bottom
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
