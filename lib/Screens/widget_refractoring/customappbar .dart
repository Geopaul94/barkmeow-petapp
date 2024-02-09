// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget {
//   final String? text;
//   const CustomAppBar({this.text, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           SizedBox(
//             width: 80,
//             height: 70,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 4.0,
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.all(7.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         // Handle back arrow tap
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 60,
//           ),
//          text!=? SizedBox(
//             width: 250, // Set desired width
//             height: 70,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               elevation: 4.0,
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       text!,
//                       style:
//                           const TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ):SizedBox()
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;

  const CustomAppBar({this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 70,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4.0,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        // Handle back arrow tap
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          if (text != null)
            SizedBox(
              width: 250, // Set desired width
              height: 70,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 4.0,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

