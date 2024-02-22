
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petapp/model/catmodel/cat_model.dart';
import "package:pointycastle/pointycastle.dart";


const CAT_DB_NAME = "cat_dataabase";

abstract class Dog_Functions {
  Future<void> AddCat(CatModel Catdetails);
    Future<List <CatModel>>getcatdtails();
  // List<CatModel> catlist = [];
}

class Dog_DB implements Dog_Functions {
  get catBox => null;

  @override
  Future<void> AddCat(CatModel CatDetails) async {
    final cat_DB = await Hive.openBox<CatModel>(CAT_DB_NAME);
    cat_DB.add(CatDetails);
  }
  
  @override
  Future<List<CatModel>> getcatdtails() async{
     final catBox = await Hive.openBox<CatModel>(CAT_DB_NAME);
      final catList = catBox.values.toList();
    await catBox.close(); // Close the box after use
    return catList;
  
   
  }
}
