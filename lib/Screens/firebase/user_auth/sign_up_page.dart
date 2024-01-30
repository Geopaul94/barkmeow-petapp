import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Screens/firebase/user_auth/firebase_auth_implementation/firebaase_auth_services.dart';
import 'package:petapp/Screens/firebase/user_auth/login_page.dart';
import 'package:petapp/Screens/firebase/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

//start from here
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const Text("Sign Up"), // Capitalized for consistency
              const SizedBox(height: 30),

              FormCntainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),

              FormCntainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(height: 15),
              FormCntainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                   
                  onPressed: _signUp, 
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 97, 182, 55),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15), // Add spacing for visual clarity
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    // String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print("User is successflully Created ");
      Navigator.pushNamed(context, "/home");
    } else {
      print("some errors happfened");
    }
  }
}
