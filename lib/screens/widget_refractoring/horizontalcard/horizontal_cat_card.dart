import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';


class HorizontalCatCard extends StatefulWidget {
  const HorizontalCatCard({super.key});

  @override
  State<HorizontalCatCard> createState() => _HorizontalCatCardState();
}

class _HorizontalCatCardState extends State<HorizontalCatCard> { 

 Future<void> _fetchPetData() async {
    await addpets();
    await getCatData();
    
    // setState(() {}); 
  }

  @override
  //  void initState() {
  //   addpets();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 225,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CatList.length,
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
                          child: CatList[index].image == null
                              ? const Center(child: Text("Add cat image"))
                              : Image.file(File(CatList[index].image!)))),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          CatList[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CatList[index].age.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CatList[index].weight.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CatList[index].gender,
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
