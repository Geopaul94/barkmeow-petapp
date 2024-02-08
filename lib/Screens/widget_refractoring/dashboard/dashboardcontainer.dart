import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  final IconData? icon;
  final String text;

  const DashboardContainer({this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      height: MediaQuery.of(context).size.height * .075,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: (
          
        ) {
          // Perform your actions here
          print('Container tapped');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 40, // Increase the icon size
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
            const Icon(
              size: 50,
              Icons.keyboard_arrow_right,
            )
          ],
        ),
      ),
    );
  }
}
