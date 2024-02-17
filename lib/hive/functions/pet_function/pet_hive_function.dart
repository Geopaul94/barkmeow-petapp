import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petapp/model/petmodel/pet_model.dart';

const String petData = 'PetData'; // Use camelCase for variable names

List<PetModel> finalPetList = [];
List<PetModel> CatList = [];
List<PetModel> DogList = [];
Future<void> addPetData({required PetModel petDetails}) async {
  try {
    final box = await Hive.openBox<PetModel>(petData);
    await box.put(petDetails.id, petDetails);
    await addPetDataList();
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}

Future<List<PetModel>> getPetData() async {
  final box = await Hive.openBox<PetModel>(
      petData); // Use correct type for opening the box
  if (kDebugMode) {
    print(box.values);
  }
  return box.values.toList();
}

Future<void> addPetDataList() async {
  finalPetList.clear();
  final data = await getPetData();
  finalPetList.addAll(data);
}

Future<List<PetModel>> getCatData() async {
  final box = await Hive.openBox<PetModel>(petData);
  final List<PetModel> allPets = box.values.toList();
  return allPets.where((pet) => pet.paws == 'Cat').toList();
}

Future<List<PetModel>> getDogData() async {
  final box = await Hive.openBox<PetModel>(petData);
  final List<PetModel> allPets = box.values.toList();
  var a = allPets.where((pet) => pet.paws == 'Dog').toList();
  print(a);
  return a;
}

Future<void> deletePetDataList({required PetModel petDetails}) async {
  final box = await Hive.openBox<PetModel>(petData);
  await box.delete(petDetails.id);
  await addPetDataList();
}

Future<void> addpets() async {
  CatList.clear();
  var a = await getCatData();
  print(a);
  CatList = await getCatData();
  DogList.clear();
  DogList = await getDogData();
  print("fghhyuuhhygjugyu");
  print(CatList);
  print(DogList);
}
