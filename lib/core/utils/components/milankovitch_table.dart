import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MilankovitchTable extends StatelessWidget {
  const MilankovitchTable({Key? key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      // Remove unnecessary "return" keyword
      decoration: const BoxDecoration(color: Colors.blue),
      dataRowMaxHeight: double.infinity,
      dataRowMinHeight: 60,
      headingRowColor: MaterialStateColor.resolveWith((states) => ILColors.primary),
      columnSpacing: 20,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Cycle Type',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Duration',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Effect on Climate',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Eccentricity')),
            DataCell(Text('-1000,000 years')),
            DataCell(Text('Alters the distance from the sun, affecting solar radiation')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Axial Tilt')),
            DataCell(Text('~41,000 years')),
            DataCell(Text('Changes the severity of seasons')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('~26,000 years')),
            DataCell(Text('Shifts the timing of seasons ')),
          ],
        ),
      ],
    );
  }
}
