import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petapp/model/dogmodel/dog_model.dart';

 const String dogData = 'dogData';

 List<DogModel> finaldoglist = [];
adddogData({required DogModel petdetails}) async {
  try {
    final datas = await Hive.openBox<DogModel>(dogData);
    await datas.put(petdetails.id, petdetails);
    await adddogDataList();
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}


Future<List<DogModel>> getdogdata() async {
  final petdatas = await Hive.openBox<DogModel>(dogData);
  if (kDebugMode) {
    print(petdatas.values);
  }
  return petdatas.values.toList();
}

 adddogDataList() async {
  finaldoglist.clear();
  final datas = await getdogdata();
  finaldoglist = List.from(datas);
}

deletedogDataList({required DogModel petdata}) async {
  final datas = await Hive.openBox<DogModel>(dogData);
  await datas.delete(petdata.id);
  await adddogDataList();
}
