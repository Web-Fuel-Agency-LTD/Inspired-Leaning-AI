import 'package:flutter/material.dart';

class ILElevatedButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;

  const ILElevatedButton({
    super.key,
    required this.width,
    required this.onPressed,
    required this.text,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(text, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
