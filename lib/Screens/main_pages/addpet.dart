import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';

import 'package:petapp/model/petmodel/pet_model.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/dashboard/homepage/homepage.dart';
// ignore: unused_import
import 'package:image_picker/image_picker.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final _focusNode = FocusNode();
  String? _selectedGender; // Set a default value for _selectedGender
  bool isSelected = false; // Tracks selection state
  String dropdownvalue = '';
  String? _selectedPaws;
  final ImagePicker _picker = ImagePicker();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  XFile? _image;

  String? image;
  Future pickImage() async {
    try {
      _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_image != null) {
        setState(() {
          image = _image!.path;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void onTap() {
    setState(() {
      isSelected = !isSelected; // Toggle selection state
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 236, 231, 231),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 4.0,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 30.0, // Adjust size if needed
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavigator()));
                      }),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 4.0,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Add Your Pet Pal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Making text bold
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              pickImage();
            },
            child: Container(
              width: 72.0,
              height: 72.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 48.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _image != null
              ? Image.file(
                  File(_image!.path),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              : Text('No image selected.'),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                shadowColor: Colors.black,
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Border radius
                    color: Colors.white, // Background color
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Name    :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Making text bold
                              fontSize: 20, // Increasing font size to 20
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: nameController,
                              focusNode: _focusNode,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                labelText: 'Enter your pet\'s name',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
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
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: ageController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Change border color when focused
                                ),
                                labelText: 'Enter your pet\'s age',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Paws  ?  :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedPaws,
                                items: ["Cat", "Dog"].map((name) {
                                  return DropdownMenuItem<String>(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPaws = value!;
                                  });
                                },
                                isExpanded: true,
                                hint: const Text(
                                  "Cat or Dog",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Weight   :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Making text bold
                              fontSize: 20, // Increasing font size to 20
                              color: Colors.black,
                            ),
                            // Increasing font size to 20
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextFormField(
                              controller: weightController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Change border color when focused
                                ),
                                labelText: 'Enter your pet\'s weight',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
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
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedGender,
                                items: ["Male", "Female"].map((name) {
                                  return DropdownMenuItem<String>(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                                isExpanded: true,
                                hint: const Text(
                                  "Choose Gender",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          String name = nameController.text;
                          int? age = int.parse(
                              ageController.text); // Define the age variable
                        String gender =_selectedGender ?? ""; // Define the isMale variable
                          // String image = image;
                          double weight  =double.parse(weightController.text);
                          String paws = _selectedPaws ?? "";
                          // Define the paws variable

                          // Call the function to add pet data
                          addPetData(
                            petDetails: PetModel(
                              id: DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString(),
                              name: name,
                              age: age,
                              gender: gender,
                              image: image,
                              weight: weight,
                              paws: paws,
                            ),
                          );

                          // Navigate to the home page after saving
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue), // Set button background color
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.black), // Set button text color
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
