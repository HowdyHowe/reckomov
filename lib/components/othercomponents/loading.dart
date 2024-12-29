import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
          child: Shimmer.fromColors(
            baseColor: Color.fromARGB(180, 46, 54, 72),
            highlightColor: Color.fromARGB(255, 76, 89, 120),
            child: Container(
              height: 225.0,
              width: 116,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
          child: Shimmer.fromColors(
            baseColor: Color.fromARGB(180, 46, 54, 72),
            highlightColor: Color.fromARGB(255, 76, 89, 120),
            child: Container(
              height: 225.0,
              width: 116,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
          child: Shimmer.fromColors(
            baseColor: Color.fromARGB(180, 46, 54, 72),
            highlightColor: Color.fromARGB(255, 76, 89, 120),
            child: Container(
              height: 225.0,
              width: 116,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
