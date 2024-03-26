import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/components/elevated_button.dart';

import '../../../../core/utils/components/greenhouse_gases.dart';
import '../../../../core/utils/components/milankovitch_table.dart';
import '../../../../core/utils/constants/colors.dart';

const String definition1 =
    'The Earth\'s position relative to the sun can vary in three significant ways – eccentricity, axial tilt, and precession. These are known as Milankovitch cycles. Eccentricity refers to the shape of the Earth’s orbit around the sun, which changes from more circular to more elliptical on a cycle of about 100,000 years. Axial tilt is the angle between the Earth\'s rotational axis and its orbital plane and changes over a 41,000-year cycle. Precession involves the wobble of the Earth on its axis over a 26,000-year period.';

const String definition2 =
    'Volcanoes release large amounts of particulate matter and gases like sulfur dioxide into the atmosphere. This can lead to the formation of volcanic aerosols that reflect sunlight and cool the Earth\'s surface.';

const String definition3 = 
    'The sun\'s energy output is not constant and can influence global temperatures. The 11-year solar cycle affects the amount of solar radiation the Earth receives.';

const String definition4 = 
    'When coal, oil, and natural gas are burned for energy, they release carbon dioxide (CO2) and other greenhouse gases. These gases trap heat in the atmosphere, leading to warming.';

const String definition5 = 
    'Trees absorb CO2, one of the main greenhouse gases. When forests are cut down, this carbon sink is reduced, and the carbon stored in trees is released into the atmosphere.';

const String definition6 =
    'Various industrial activities and the waste generated from them contribute to the accumulation of greenhouse gases. For example, cement production releases CO2, and landfills release methane.';


class TextbookScreen extends StatefulWidget {
  const TextbookScreen({super.key});

  @override
  State<TextbookScreen> createState() => _TextbookScreenState();
}

class _TextbookScreenState extends State<TextbookScreen> {
  bool continueReading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Module 5',
          style: TextStyle(
              color: ILColors.primary, fontWeight: FontWeight.w600),
        ),
        const Text(
          'Natural Causes of Climate Change',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text(
          'Orbital Changes',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          definition1,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Milankovitch Cycles',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(
            width: double.infinity,
            height: 300,
            child: MilankovitchTable()),
        const SizedBox(height: 20),
        const Text(
          'Volcanic Activity',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          definition2,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Image.asset('assets/module/module_1.png', height: 261,),
        const SizedBox(height: 20),
        const Text(
          'Solar Output',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          definition3,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Image.asset('assets/module/module_2.png', height: 261,),
        
        const SizedBox(height: 20),
        Visibility(
          visible: continueReading,
          child: Column(children: [
            const Text(
            'Human Causes of Climate Change',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            'Burning Fossil Fuels',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            definition4,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Greenhouse Gases from Fossil',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
              width: double.infinity,
              height: 300,
              child: GreenhouseGasesTable()),
          const SizedBox(height: 20),
          const Text(
            'Deforestation',
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            definition5,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/module/module_3.png', height: 261,),
          const SizedBox(height: 20),
          const Text(
            'Industrial Processes and Waste',
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            definition6,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 20),
        
          ],),
        ),
        ILElevatedButton(
          width: double.infinity,
          onPressed: (){
            setState(() {
              continueReading = true;
            });
          }, text: 'Continue'),
      ],
    );
    
  }
}
