import 'package:flutter/material.dart';

class PrimaryHome extends StatelessWidget {
  const PrimaryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 16, 24, 177),
              Color.fromARGB(255, 143, 145, 186)
            ])),
        child: Column(
          children: [
            Text("Add your pet"),
            Row(
              children: [
              Container(
  height: 100,
  width: 100,
  child: Image.asset(
    'path/to/your/image.png', // Replace with your image path
    fit: BoxFit.cover, // This ensures the image fills the container
  ),
),
                Container(
                  height: 100,
                  width: 100,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
