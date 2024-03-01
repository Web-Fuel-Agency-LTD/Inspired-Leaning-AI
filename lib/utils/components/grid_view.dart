// import 'package:flutter/material.dart';

// class ILGridView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Two Column GridView'),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.0, // Adjust spacing between columns
//           mainAxisSpacing: 10.0, // Adjust spacing between rows
//           childAspectRatio: 1.0, // Adjust aspect ratio of grid items
//         ),
//         itemCount: 20, // Set the number of items in the GridView
//         itemBuilder: (context, index) {
//           // Build each grid item
//           return GridTile(
//             child: Container(
//               color: Colors.blueGrey, // Set background color of each grid item
//               child: const Center(
//                 child: Text(
//                   'Item',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
