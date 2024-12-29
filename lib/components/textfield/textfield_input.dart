import 'package:flutter/material.dart';

class TextfieldInput extends StatelessWidget {
  final String hint;
  final control_data;
  final bool obscure_text;
  final icon;
  TextfieldInput(
      {super.key,
      required this.hint,
      required this.control_data,
      required this.obscure_text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 50,
        width: 250,
        child: TextField(
          obscureText: obscure_text,
          controller: control_data,
          decoration: InputDecoration(
              suffixIcon: Icon(icon),
              suffixIconColor: WidgetStateColor.resolveWith((states) =>
                  states.contains(WidgetState.focused)
                      ? Colors.white
                      : Colors.grey),
              focusColor: Colors.black,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[300], fontSize: 15),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 226, 226, 226))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 46, 54, 72)))),
        ),
      ),
    );
  }
}
