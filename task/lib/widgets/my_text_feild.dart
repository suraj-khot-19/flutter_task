import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  final bool isPassword;
  final VoidCallback? onTap;
  const MyTextFeild({
    super.key,
    required this.hintText,
    this.isObsecure = false,
    required this.controller,
    this.onTap,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onTap,
                icon: Icon(
                  isObsecure
                      ? Icons.visibility_off_sharp
                      : Icons.visibility_sharp,
                ),
              )
            : const SizedBox(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hintText is required";
        } else {
          return null;
        }
      },
    );
  }
}
