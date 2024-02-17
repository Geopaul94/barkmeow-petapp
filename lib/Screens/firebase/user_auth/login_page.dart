import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petapp/screens/components/components.dart';

import 'package:petapp/screens/firebase/user_auth/sign_up_page.dart';

import 'package:petapp/screens/main_pages/bottom_navigator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email = '';
  // String _password = '';
  bool _emailValid = false;
  bool _passwordValid = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const OnbordingContainers(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.3,

                // decoration: BoxDecoration(color: Colors.amber),
                child: Lottie.asset(
                  'assets/dog.json',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 285,
                height: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 1, 1, 1).withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    _emailValid ? Colors.green : Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    _emailValid ? Colors.green : Colors.blue),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _emailValid = RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$')
                                .hasMatch(value);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$')
                              .hasMatch(value)) {
                            return 'Please enter a valid Gmail or Outlook email';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),

//                       TextFormField(
//   controller: _emailController,
//   decoration: InputDecoration(
//     hintText: 'Email',
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: _emailValid ? Colors.green : Colors.black),
//     ),
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: _emailValid ? Colors.green : Colors.blue),
//     ),
//     errorBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: Colors.red),
//     ),
//     focusedErrorBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: Colors.red),
//     ),
//   ),
//   onChanged: (value) {
//     setState(() {
//       _email = value;
//     });
//   },
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter an email';
//     } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$').hasMatch(value)) {
//       return 'Please enter a valid Gmail or Outlook email';
//     }
//     return null; // Return null if the input is valid
//   },
// ),
                      const SizedBox(height: 15),

                      // TextFormField(
                      //   controller: _passwordController,
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     hintText: 'Password',
                      //     errorText: _passwordValid
                      //         ? null
                      //         : 'Please enter your password',
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: _passwordValid
                      //               ? Colors.green
                      //               : Colors.black),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: _passwordValid
                      //               ? Colors.green
                      //               : Colors.blue),
                      //     ),
                      //     errorBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.red),
                      //     ),
                      //     focusedErrorBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.red),
                      //     ),
                      //   ),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       // _password = value;
                      //       _passwordValid = value.isNotEmpty;
                      //     });
                      //   },
                      // ),
                     TextFormField(
  controller: _passwordController,
  obscureText: true,
  decoration: InputDecoration(
    hintText: 'Password',
    errorText: _passwordValid ? null : 'Please enter your password',
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: _passwordValid ? Colors.green : Colors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: _passwordValid ? Colors.green : Colors.blue),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
  ),
  onChanged: (value) {
    // Handle validation only after typing starts
    if (value.isEmpty) {
      // Reset validation and border color
      _passwordValid = false;
      setState(() {});
      return;
    }

    // Perform desired validation
    _passwordValid = value.length >= 8; // Example: Minimum length of 8 characters
    setState(() {});
  },
),

                     
                     
                     
                     
                     
                     
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          _signUp();
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                  (route) => false, // Remove all previous routes
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);
      // await _auth.signInWithEmailAndPassword(email, password);
      print("succesful");

      Navigator.push(context, MaterialPageRoute(
        builder: ((context) {
          return const BottomNavigator();
        }),
      ));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
