import 'package:flutter/material.dart';
import 'package:petapp/screens/widget_refractoring/customappbar%20.dart';

import 'package:petapp/screens/widget_refractoring/dashboard/dashboardcontainer.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(153, 193, 190, 190),
                Color.fromARGB(153, 130, 128, 128)
              ],
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .70,
                width: MediaQuery.of(context).size.width * .75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('demo data',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )),
                                  Text(
                                    'demo subtitle',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DashboardContainer(
                        text: 'My Profile',
                        icon: Icons.person,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DashboardContainer(
                        text: 'Edit  Profile',
                        icon: Icons.edit_note,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DashboardContainer(
                        text: 'Log Out',
                        icon: Icons.logout,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DashboardContainer(
                        text: 'Privacy Policy ',
                        icon: Icons.policy,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DashboardContainer(
                        text: 'Terms And \n Condition',
                        icon: Icons.article,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DashboardContainer(
                        text: 'About Us',
                        icon: Icons.help,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
