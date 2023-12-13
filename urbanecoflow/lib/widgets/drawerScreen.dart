// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:urbanecoflow/pages/TrendScreen.dart';
import 'package:urbanecoflow/pages/itemScreen.dart';
import 'package:urbanecoflow/utils/colors.dart';

import '../controllers/user_controller.dart';
import '../main.dart';
import '../pages/Homepage.dart';
import '../pages/splashscreen.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      surfaceTintColor: whiteColor,
      backgroundColor: whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: whiteColor,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/img3.png", // Replace with your logo asset path
                      width: 80, // Adjust width as needed
                      height: 80, // Adjust height as needed
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ref.watch(userProvider).data!.name.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ])),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              //Navigate to the home page

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.person),
          //   title: const Text('Account'),
          //   onTap: () {
          //     Navigator.pop(context); // Close the drawer
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const UserAccountPage(
          //           userName: 'christine', // Replace with actual user data
          //           userEmail:
          //               'christinenalubwama4@gmail.com', // Replace with actual user data
          //         ),
          //       ),
          //     );
          //     // Navigate to the account page
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.wind_power_rounded),
            title: const Text(
              'Impact',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrendsScreen(),
                ),
              );
              // Navigate to schools with fees and requirements page
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemsScreen(),
                ),
              );
              // Navigate to schools with fees and requirements page
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.power_settings_new_rounded, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              await auth.signOut();
              // Navigate to the feed page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
