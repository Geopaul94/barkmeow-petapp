import 'package:hive_flutter/hive_flutter.dart';
part 'dog_model.g.dart';

@HiveType(typeId: 2
)
class DogModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;

  @HiveField(3)
  final bool isMale;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String weight;

  DogModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.isMale,
      required this.image,
      required this.weight});
}
