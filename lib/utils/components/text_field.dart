import 'package:flutter/material.dart';

class ILTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final Icon? prefix;

  const ILTextField({
    super.key, // Add Key? key parameter
    required this.controller,
    required this.hintText,
    this.obscureText = true,
    this.icon,
    this.prefix,
  }); // Call superclass constructor

  @override
  State<ILTextField> createState() => _ILTextFieldState();
}

class _ILTextFieldState extends State<ILTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText, // Use widget.obscureText
      decoration: InputDecoration(
        prefixIcon: widget.prefix, // Use widget.prefix
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        suffixIcon: widget.icon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Update local state
                  });
                },
                icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
