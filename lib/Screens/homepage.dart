import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: const SafeArea(
  child: Center(
    child: Text(
      "Welcome to Home Page",
      style: TextStyle(fontSize: 24), // Adjust text size as needed
    ),
  ),
    ));

        
    


}}