import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:petapp/Screens/firebase/user_auth/firebase_auth_implementation/firebaase_auth_services.dart';
import 'package:petapp/screens/firebase/user_auth/login_page.dart';
import 'package:petapp/screens/firebase/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final FirebaseAuthService _auth = FirebaseAuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _emailValid = true;
  // bool _passwordValid = true;
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
        body: SingleChildScrollView(
            child: Container(
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
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Column(children: [
                    Container(
                      child: Lottie.asset(
                        'assets/cat dog lady.json', // Adjust the asset path accordingly
                      ),
                      // decoration: BoxDecoration(color: Colors.amber),
                    ),
                    const SizedBox(height: 1),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 300,
                        height: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 1, 1, 1)
                                  .withOpacity(0.4),
                              blurRadius: 15,
                              spreadRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // FormCntainerWidget(
                                  //   controller: _usernameController,
                                  //   hintText: "Username",
                                  //   isPasswordField: false,
                                  // ),
FormCntainerWidget(
  controller: _emailController,
  hintText: "Email",
  isPasswordField: false,
  onChanged: (value) {
    setState(() {
      _emailValid = RegExp(
        r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$', // Use raw string for regex
      ).hasMatch(value);
    });
  },
  errorText: _emailValid ? null : 'Please enter a valid email',
),

                                  const SizedBox(height: 15),
                                  FormCntainerWidget(
                                    controller: _passwordController,
                                    hintText: "Password",
                                    isPasswordField: true,
                                    onChanged: (value) {},
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
                                          color:
                                              Color.fromARGB(255, 97, 182, 55),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]))),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 246, 244, 244),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 173, 4, 202),
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
                  ]),
                ),
              ]),
        )));
  }

  void _signUp() async {
    // String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    // User? user = await _auth.signUpWithEmailAndPassword(email, password);
    // if (user != null) {
    //   print("User is successflully Created ");
    //   Navigator.pushNamed(context, "/home");
    // } else {
    //   print("some errors happfened");
    // }
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
