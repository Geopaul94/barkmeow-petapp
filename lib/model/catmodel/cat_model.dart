

import 'package:hive_flutter/hive_flutter.dart';

part 'cat_model.g.dart';

@HiveType(typeId: 1)
class CatModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int? age; // Changed type to int

  @HiveField(3)
  final bool isMale;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final double? weight; // Changed type to double

 

  CatModel({
    required this.id,
    required this.name,
     this.age,
    required this.isMale,
   required  this.image,
     this.weight, 
     
 
  });
}
