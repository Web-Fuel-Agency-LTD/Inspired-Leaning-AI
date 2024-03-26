import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GreenhouseGasesTable extends StatelessWidget {
  const GreenhouseGasesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      decoration: const BoxDecoration(color: Colors.blue),
      dataRowMaxHeight: double.infinity,
      dataRowMinHeight: 60,
      headingRowColor: MaterialStateColor.resolveWith((states) => ILColors.primary),
      columnSpacing: 35,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Fossil \nFuel',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Greenhouse \nGas Emitted',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Contribution to \nGreenhouse Effect',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Coal')),
            DataCell(Text('CO2, methane, nitrogen oxides')),
            DataCell(Text('High')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Oil')),
            DataCell(Text('CO2, methane')),
            DataCell(Text('Medium')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Natural Gas')),
            DataCell(Text('CO2, methane (less than coal)')),
            DataCell(Text('Lower')),
          ],
        ),
      ],
    );
  }
}