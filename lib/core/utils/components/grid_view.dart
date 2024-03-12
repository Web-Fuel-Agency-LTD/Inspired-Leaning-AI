import 'package:flutter/material.dart';

class HomePageGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green], // Gradient colors
          begin: Alignment.topLeft, // Gradient start position
          end: Alignment.bottomRight, // Gradient end position
        ),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: 10, // Number of items in the GridView
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white, // Card background color
            elevation: 5, // Card elevation
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
