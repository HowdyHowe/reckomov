import 'package:flutter/material.dart';
import 'package:reckomov_app/components/textfield/textfield_input.dart';
import 'package:reckomov_app/service/service_signin.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller_email_signin = TextEditingController();
  final controller_username_signin = TextEditingController();
  final controller_password_signin = TextEditingController();
  final controller_password_signin_confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Layer 1 Gradient Color
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(1, 1),
                    colors: <Color>[
                  Color.fromARGB(255, 46, 54, 72),
                  Color.fromARGB(255, 255, 255, 255),
                ])),
          ),

          // Layer 2 Form Field
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "D A F T A R",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        child: Text(
                          "masukkan email dan password anda",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              color: Color.fromARGB(255, 138, 138, 138)),
                        ),
                      ),
                      TextfieldInput(
                        hint: "email",
                        control_data: controller_email_signin,
                        obscure_text: false,
                        icon: Icons.email_outlined,
                      ),
                      TextfieldInput(
                        hint: "username",
                        control_data: controller_username_signin,
                        obscure_text: false,
                        icon: Icons.text_format,
                      ),
                      TextfieldInput(
                        hint: "password",
                        control_data: controller_password_signin,
                        obscure_text: true,
                        icon: Icons.password_outlined,
                      ),
                      TextfieldInput(
                        hint: "konfirmasi password",
                        control_data: controller_password_signin_confirm,
                        obscure_text: true,
                        icon: Icons.password_outlined,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // Background color
                            backgroundColor: Color.fromARGB(255, 46, 54, 72),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Rounded corners
                            ),
                          ),
                          onPressed: () {
                            serviceSignin(
                                context,
                                controller_email_signin.text,
                                controller_username_signin.text,
                                controller_password_signin.text,
                                controller_password_signin_confirm.text);
                            FocusScope.of(context).unfocus();
                          },
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        width: 250,
                        height: 30,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "sudah memiliki akun?",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/login', (route) => false);
                              },
                              child: Text(
                                "login disini",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
