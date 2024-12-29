import 'package:flutter/material.dart';
import 'package:reckomov_app/components/textfield/textfield_input.dart';
import 'package:reckomov_app/service/service_forget.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final controller_email = TextEditingController();

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
                        "L U P A  P A S S W O R D",
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
                          "Masukkan email akun anda",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              color: Color.fromARGB(255, 138, 138, 138)),
                        ),
                      ),
                      TextfieldInput(
                        hint: "email",
                        control_data: controller_email,
                        obscure_text: false,
                        icon: Icons.email_outlined,
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
                            serviceForget(
                                context, controller_email.text.toString());
                            FocusScope.of(context).unfocus();
                          },
                          child: Text(
                            'KIRIM',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
