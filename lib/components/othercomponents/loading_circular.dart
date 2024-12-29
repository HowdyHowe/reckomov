import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 46, 54, 72)),
          strokeWidth: 3.0,
        ),
        SizedBox(height: 20),
        Text(
          "M E M U A T",
          style: TextStyle(
            color: Color.fromARGB(255, 46, 54, 72),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
