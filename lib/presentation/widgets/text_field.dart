import 'package:flutter/material.dart';

Widget textField(BuildContext context, TextEditingController controller,
    String hint, TextInputType keyboardType, bool isObscured) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
      color: const Color(0xFFAC9E8D),
      borderRadius: BorderRadius.circular(15.0),
    ),
    width: MediaQuery.of(context).size.width * 0.8,
    child: Center(
      child: TextField(
        obscureText: isObscured,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
