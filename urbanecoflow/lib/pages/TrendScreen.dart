import 'package:flutter/material.dart';
import 'package:urbanecoflow/widgets/trendWidget.dart';

class TrendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impact'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            
            Navigator.pop(context);
          },
      ),
      ),
      body: TrendWidget(), // Display the TrendsWidget or any other content you desire
    );
  }
}