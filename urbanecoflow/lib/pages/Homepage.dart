import 'package:flutter/material.dart';
import 'package:urbanecoflow/pages/widgets/app_button_widget.dart';
import 'package:urbanecoflow/pages/widgets/text_field_widget.dart';
import 'package:urbanecoflow/utils/colors.dart';
import 'package:urbanecoflow/widgets/categoriesWidget.dart';
import 'package:urbanecoflow/widgets/drawerScreen.dart';
import 'package:urbanecoflow/widgets/itemsWidget.dart';
import 'package:urbanecoflow/widgets/trendWidget.dart';

import 'appointment_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AppointmentListPage()),
            );
          },
          icon: const Icon(Icons.bookmark, color: whiteColor),
          label: const Text(
            'Appointments',
            style: TextStyle(color: whiteColor),
          )),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        surfaceTintColor: const Color.fromARGB(255, 238, 238, 238),
        title: const Text("Urban EcoFlow"),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFieldWidget(
              prefixIcon: Icon(
                Icons.search,
                size: 25,
                color: Colors.grey,
              ),
              hint: "Search....",
            ),
          ),
          const SizedBox(height: 20.0),
          AppButtonWidget(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddAppointmentPage()));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PickupScreen()),
              // );
            },
            child: const Text(
              'Schedule Pickup',
              style: TextStyle(
                  color: whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          // const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: const Text(
              "Up Coming Pickup",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          CategoriesWidget(),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: const Text(
              "For Segregation of Waste at source",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const ItemsWidget(),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: const Text(
              "Impact",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const TrendWidget(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
