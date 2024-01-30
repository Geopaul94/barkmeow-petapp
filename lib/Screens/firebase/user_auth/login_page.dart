
import 'package:flutter/material.dart';
import 'package:petapp/Screens/components/components.dart';
import 'package:petapp/Screens/firebase/user_auth/sign_up_page.dart';
import 'package:petapp/Screens/firebase/widgets/form_container_widget.dart';
import 'package:petapp/Screens/homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
        children: [
          const OnbordingContainers(),
        //   Image.asset(
        //  'assets/images/your_image.png', // Replace with your image path
        //     width: double.infinity,
        //     height: 400, // Adjust height as needed
        //     fit: BoxFit.cover, // Adjust image fit as desired
        //   ),

          // Positioned container
          Positioned(
            top: 420,
            left: 50,
            child: Container(
              width: 285,
              height:270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 203, 17, 144).withOpacity(0.4),
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
  
                children: [
                  
                  
                  FormCntainerWidget(hintText: "Email",
                  isPasswordField: false,
                  
                  
                  ),const SizedBox(height: 15),
                   FormCntainerWidget(hintText: "Password",
                  isPasswordField: true,
                  
                  
                  ),
                  
                  // const TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Email',
                  //   ),
                  // ),
                  const SizedBox(height: 15),
                  // const TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: 'Password',
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,MaterialPageRoute(builder: ((context) =>const HomePage(

                      ) 
                      ) 
                   ) );}
                   , child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),

        
        Positioned(
  top: 720, // Adjust vertical position as needed
  left: 85, // Centered horizontally within container's width

  // Wrap text and button in a Column for vertical stacking
  child: Column(
    children: [
      // RichText allows formatting within Text widget
      RichText(
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        
      ),
      ),

      
    TextButton(
  onPressed: () => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => SignUpPage()),
    (route) => false, // Remove all previous routes
  ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  ),
),
    ]  ),
    );
  }
}


   