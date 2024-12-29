import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  final sample_icon;
  const Sample({super.key, this.sample_icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 46, 54, 72),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Icon(
        sample_icon,
        color: Colors.white,
      )),
    );
  }
}
