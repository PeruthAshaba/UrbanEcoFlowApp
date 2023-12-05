import 'package:flutter/material.dart';
import 'package:urbanecoflow/pages/TrendScreen.dart';
import 'package:urbanecoflow/pages/itemScreen.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text('Impact'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrendsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Category'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
