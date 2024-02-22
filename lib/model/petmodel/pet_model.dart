import 'package:hive_flutter/hive_flutter.dart';
part 'pet_model.g.dart';


@HiveType(typeId: 1)
class PetModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int? age; // Changed type to int

  @HiveField(3)
  final  String gender;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final double? weight; // Changed type to double
 @HiveField(6)
  final String paws;
 

  PetModel
  
  
  ({
    required this.id,
    required this.name,
     this.age,
    required this.gender,
   this.image,
     this.weight, 
     required
       this.paws, 
     
 
  });
}
