

import 'package:flutter/material.dart';


class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: CustomAppBar({}, title: 'Training'), // Pass an empty map if not needed

        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
            child: const Column(
              children: [
                Expanded(
                    child: const Text(
                        "Welcome to Training Page")), // Allow text to expand
                // BottmNavigator(),
              ],
            ),
          ),
        ));
  }
}
