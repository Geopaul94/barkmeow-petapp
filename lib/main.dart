import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:petapp/Screens/firebase/splash_screen.dart';
import 'package:petapp/Screens/homepage.dart';
import 'package:petapp/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barkmeow',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreen());
  }
}
