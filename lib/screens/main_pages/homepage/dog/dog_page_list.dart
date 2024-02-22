import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';

import 'package:petapp/model/petmodel/pet_model.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/homepage/homepage.dart';
// ignore: unused_import
import 'package:image_picker/image_picker.dart';
import 'package:petapp/screens/widget_refractoring/horizontalcard/horizontal_cat_card.dart';

class DogPage extends StatelessWidget {
  const DogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CatList"),
        ),
        body: SizedBox(
          height: 225,
          width: 400,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
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
        ));
  }
}
