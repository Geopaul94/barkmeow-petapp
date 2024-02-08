import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  elevation: 4.0,
  color: Colors.blue,
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Text Here",
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back arrow tap
          },
        ),
      ],
    ),
  ),
),
      ),
    );
  }
}
