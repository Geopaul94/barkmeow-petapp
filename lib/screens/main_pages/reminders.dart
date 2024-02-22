import 'package:flutter/material.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 10, // No shadow
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 16, 24, 177),
                Color.fromARGB(255, 76, 78, 128),
              ],
            ),
          ),
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30, // Adjust size as needed
                ),
                onPressed: () {
                  // Handle back arrow press
                },
              ),
              const SizedBox(width: 80), // Adjust spacing as needed
              const Text(
                'Reminders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30, // Adjust size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Center(
                            child: Text(
                              "Reminder Types", // Changed the heading for the first card
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildFavoriteItem(context, "Vaccine",
                                  'assets/vaccine.jpg', Colors.blue),
                              _buildFavoriteItem(context, "Medicine",
                                  'assets/medicine.jpg', Colors.amber),
                              _buildFavoriteItem(context, "Others",
                                  'assets/cat png.webp', Colors.orange),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Reminder List", // Heading for the second container
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Add your delete function here
                                },
                                icon: const Icon(Icons.delete,
                                    color: Colors.black),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Add your edit function here
                                },
                                icon:
                                    const Icon(Icons.edit, color: Colors.black),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.alarm,
                                  color: Colors.red), // Clock icon
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Add your reminder list items here
                          const ListTile(
                            title: Text("Reminder 1"),
                            subtitle: Text("Details for Reminder 1"),
                            trailing: Icon(Icons.alarm),
                          ),
                          const ListTile(
                            title: Text("Reminder 2"),
                            subtitle: Text("Details for Reminder 2"),
                            trailing: Icon(Icons.alarm),
                          ),
                          // Add more ListTile widgets for additional reminders
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "See All", // Changed the text to "See All"
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "See All", // Changed the text to "See All"
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(
      BuildContext context, String title, String imagePath, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
