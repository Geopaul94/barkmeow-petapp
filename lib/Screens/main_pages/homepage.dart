import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.075, // Adjust as needed
                    width: MediaQuery.of(context).size.width *
                        0.2, // Adjust as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Cat",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  // SizedBox(width: 5),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.075, // Adjust as needed
                    width: MediaQuery.of(context).size.width *
                        0.2, // Adjust as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Dog",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Center(child: Text("Welcome to Home Page ")),
              ),
              // /BottmNavigator(),
            ],
          ),
        ),
      ),
    );
  }
}
