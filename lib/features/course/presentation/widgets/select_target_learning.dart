import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';

class SelectTargetLearning extends StatefulWidget {
  final List<String> targetLearnings;
  final Function(String) onTargetLearningSelected;
  const SelectTargetLearning(
      {super.key,
      required this.targetLearnings,
      required this.onTargetLearningSelected});

  @override
  State<SelectTargetLearning> createState() => _SelectExamBoardState();
}

class _SelectExamBoardState extends State<SelectTargetLearning> {
  String? selectedTargetLearning;

  void onClick(int index) {
    setState(() => selectedTargetLearning = widget.targetLearnings[index]);
    widget.onTargetLearningSelected(widget.targetLearnings[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ILColors.light,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Choose Learning Target',
                style: TextStyle(
                  color: ILColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  children: widget.targetLearnings
                      .map(
                        (targetLearning) => RadioListTile(
                          title: Text(
                            targetLearning,
                            style: const TextStyle(fontSize: 16),
                          ),
                          value: targetLearning,
                          groupValue: selectedTargetLearning,
                          onChanged: (value) {
                            setState(() {
                              selectedTargetLearning = value;
                            });
                            widget.onTargetLearningSelected(value!);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  if (selectedTargetLearning != null) {
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: selectedTargetLearning == null
                          ? Colors.grey
                          : ILColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'OK',
                          style: TextStyle(
                            color: ILColors.light,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
