import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/screens/main_pages/homepage/cat/cat_page_list.dart';
import 'package:petapp/screens/main_pages/homepage/dog/dog_page_list.dart';
import 'package:petapp/screens/widget_refractoring/horizontalcard/horizontal_cat_card.dart';
import 'package:petapp/screens/widget_refractoring/horizontalcard/horizontal_dog_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  
  //  Future<void> _fetchPetData() async {
  //   await addpets(); // Refresh cached lists
  //   setState(() {}); // Trigger UI update
  // }

  @override
  // void initState() {
  //   super.initState();
  //   _fetchPetData();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 16, 24, 177),
              Color.fromARGB(255, 143, 145, 186),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CatPage()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Cat",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DogPage()));
                        print("taped");
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Dog",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     const HorizontalCatCard(),



               
                    const SizedBox(height: 20),
                     HorizontalDogCard(),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
