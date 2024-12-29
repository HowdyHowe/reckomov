import 'package:flutter/material.dart';

class TextfieldPagebar extends StatelessWidget {
  final hint;
  final control_data;
  final icon;
  const TextfieldPagebar({
    super.key,
    required this.hint,
    required this.control_data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 50,
        width: 250,
        child: TextField(
          controller: control_data,
          decoration: InputDecoration(
              suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      iconColor: Color.fromARGB(255, 125, 125, 125),
                      shadowColor: Colors.transparent,
                      backgroundColor: Color(0x00FFFFFF)),
                  onPressed: () {},
                  child: Icon(icon)),
              suffixIconColor: WidgetStateColor.resolveWith((states) =>
                  states.contains(WidgetState.focused)
                      ? Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 125, 125, 125)),
              focusColor: Colors.black,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 198, 198, 198))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 142, 142, 142)))),
        ),
      ),
    );
  }
}
