import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:reckomov_app/components/othercomponents/sample.dart';
import 'package:reckomov_app/components/textfield/textfield_input.dart';
import 'package:reckomov_app/pages/login_forgetpage.dart';
import 'package:reckomov_app/pages/login_signinpage.dart';
import 'package:reckomov_app/service/service_login.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email_control_data = TextEditingController();
  final password_control_data = TextEditingController();

  @override
  void dispose() {
    email_control_data.dispose();
    password_control_data.dispose();
    super.dispose();
  }

  ambilData<List>() {
    String email = email_control_data.text.toString();
    String password = password_control_data.text.toString();
    return [email, password];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
                        "S E L A M A T  D A T A N G",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 46, 54, 72)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.login_rounded,
                        size: 100,
                        color: Color.fromARGB(255, 46, 54, 72),
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
                        control_data: email_control_data,
                        obscure_text: false,
                        icon: Icons.email_outlined,
                      ),
                      TextfieldInput(
                        hint: "password",
                        control_data: password_control_data,
                        obscure_text: true,
                        icon: Icons.password_outlined,
                      ),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgetPage()));
                              },
                              child: Text(
                                "lupa kata sandi?",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.blue),
                              ),
                            )
                          ],
                        ),
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
                          onPressed: () async {
                            serviceLogin(context, email_control_data.text,
                                password_control_data.text);
                            FocusScope.of(context).unfocus();
                          },
                          child: Text(
                            'LOGIN',
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
                              "belum memiliki akun?",
                              style: TextStyle(fontSize: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              },
                              child: Text(
                                "buat akun disini",
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
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 60, right: 60),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 46, 54, 72),
                      )),
                      Text(
                        "  follow us  ",
                        style: TextStyle(fontSize: 10),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 46, 54, 72),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Sample(
                        sample_icon: FontAwesomeIcons.facebook,
                      ),
                      Sample(
                        sample_icon: FontAwesomeIcons.instagram,
                      ),
                      Sample(
                        sample_icon: FontAwesomeIcons.twitter,
                      ),
                      Sample(
                        sample_icon: FontAwesomeIcons.threads,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
