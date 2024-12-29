import 'package:flutter/material.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';
import 'package:reckomov_app/service/service_account.dart';
import 'package:reckomov_app/components/textfield/textfield_input.dart';

class AccountEditPage extends StatefulWidget {
  final username;
  final email;
  final password;
  const AccountEditPage({
    super.key,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  State<AccountEditPage> createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  List list1 = [];
  late TextEditingController controller_username;
  late TextEditingController controller_password;

  @override
  void dispose() {
    controller_username.dispose();
    controller_password.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    controller_username = TextEditingController(text: widget.username);
    controller_password = TextEditingController(text: widget.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ResAppbar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username"),
                  TextfieldInput(
                      hint: "username",
                      control_data: controller_username,
                      obscure_text: false,
                      icon: Icons.abc),
                ],
              )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password"),
                      TextfieldInput(
                          hint: "password",
                          control_data: controller_password,
                          obscure_text: false,
                          icon: Icons.password),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Background color
                    backgroundColor: Color.fromARGB(255, 46, 54, 72),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  onPressed: () async {
                    serviceEditAccount(
                        context,
                        controller_password.text.toString(),
                        controller_username.text.toString());
                  },
                  child: Text(
                    'Perbarui',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
