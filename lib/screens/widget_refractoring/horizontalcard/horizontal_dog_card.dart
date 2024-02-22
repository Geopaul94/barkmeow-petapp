import 'dart:io';

import 'package:flutter/material.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';

class HorizontalDogCard extends StatefulWidget {
  HorizontalDogCard({Key? key});

  @override
  State<HorizontalDogCard> createState() => _HorizontalDogCardState();
}

class _HorizontalDogCardState extends State<HorizontalDogCard> {
  Future<void> _fetchPetData() async {
    await addpets();
    // Refresh cached lists
   // setState(() {}); // Trigger UI update
  }

  @override
  // void initState() {
  //   addpets();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DogList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 175,
                  child: Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: DogList[index].image != null
                          ? Image.file(File(DogList[index]
                              .image!)) // Use non-null assertion after null check
                          : const Center(
                              child: Text("Add Dog image"),
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DogList[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DogList[index].age.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DogList[index].weight.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DogList[index].gender,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
