import 'package:flutter/material.dart';

class CardAccount extends StatelessWidget {
  final String preferensi;
  final String username;
  final String email;
  const CardAccount(
      {super.key,
      required this.preferensi,
      required this.username,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Preferensi"),
          Container(
            width: 400,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Text(
              preferensi,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Username"),
          Container(
            width: 400,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Text(
              username,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Email"),
          Container(
            width: 400,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1)),
            child: Text(
              email,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
