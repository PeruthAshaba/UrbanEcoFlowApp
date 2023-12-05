import 'package:flutter/material.dart';
import 'package:urbanecoflow/widgets/itemsWidget.dart';


class ItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Wastes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            
            Navigator.pop(context);
          },
      )
      ),
      body:
          ItemsWidget(), 
    );
  }
}
