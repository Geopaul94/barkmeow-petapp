import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
          Color.fromARGB(255, 16, 24, 177),
          Color.fromARGB(255, 143, 145, 186)
        ])));
  }
}
