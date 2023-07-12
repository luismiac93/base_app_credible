import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String hintText;

  final Function(String) onChanged;

  final bool obscureText;

  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        filled: true,
        fillColor: const Color(0xffF8F8F8),
        hintText: hintText,
      ),
    );
  }
}

