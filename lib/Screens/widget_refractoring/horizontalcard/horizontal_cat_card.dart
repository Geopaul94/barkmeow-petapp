import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/model/petmodel/pet_model.dart';

class HorizontalCatCard extends StatelessWidget {
  HorizontalCatCard({Key? key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CatList.length,
        itemBuilder: (context, index) {
        
          return Container(
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
            child: Center(
              child: Text(
                CatList[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
