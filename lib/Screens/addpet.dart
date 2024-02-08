import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/homepage.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  final _focusNode = FocusNode();
  String _selectedGender = '';
  bool isSelected = false; // Tracks selection state

  void onTap() {
    setState(() {
      isSelected = !isSelected; // Toggle selection state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Add Your Buddy",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Making text bold
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
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
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/cat png.webp', // Replace with your image path
                      fit: BoxFit
                          .cover, // This ensures the image fills the container
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/dog.jpg', // Replace with your image path
                      fit: BoxFit
                          .cover, // This ensures the image fills the container
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Name    :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, // Making text bold
                              fontSize: 20, // Increasing font size to 20
                              color: Colors.white),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            focusNode: _focusNode,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              labelText: 'Enter your pet\'s name',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Age        :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, // Making text bold
                              fontSize: 20, // Increasing font size to 20
                              color: Colors.white),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .red), // Change border color when focused
                              ),
                              labelText: 'Enter your pet\'s age',  labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Breed     :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: isSelected
                                ? Colors.red
                                : Colors
                                    .white, // Change color based on selection
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: onTap, // Tap gesture detects touch
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: isSelected
                                        ? Colors.red
                                        : Colors
                                            .white, // Change border color based on selection
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Focus border always red
                                ),
                                labelText: 'Enter your pet\'s Breed',
                                labelStyle: TextStyle(
                                    color: isSelected
                                        ? Colors.red
                                        : Colors
                                            .white), // Change label color based on selection
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Weight   :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, // Making text bold
                              fontSize: 20, // Increasing font size to 20
                              color: Colors.white),
                          // Increasing font size to 20
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .red), // Change border color when focused
                              ),
                              labelText: 'Enter your pet\'s weight',  labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Gender   :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, // Making text bold
                              fontSize: 20, // Increasing font size to 20
                              color: Colors.white),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            readOnly: true, // Disable text input
                            onTap: () {
                              // Show dialog to select gender
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Select Gender"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: const Text('Male'),
                                          onTap: () {
                                            setState(() {
                                              _selectedGender = 'Male';
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Female'),
                                          onTap: () {
                                            setState(() {
                                              var _selectedGender = 'Female';
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: _selectedGender.isEmpty
                                  ? 'Select gender'
                                  : _selectedGender,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      child: const Text('Save'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
