import 'package:flutter/material.dart';
import 'package:reckomov_app/components/card/card_account.dart';
import 'package:reckomov_app/pages/account_editpage.dart';
import 'package:reckomov_app/pages/account_privacypolice.dart';
import 'package:reckomov_app/pages/account_termsofservice.dart';
import 'package:reckomov_app/service/service_account.dart';
import 'package:shimmer/shimmer.dart';

class AccountMainPage extends StatefulWidget {
  const AccountMainPage({super.key});

  @override
  State<AccountMainPage> createState() => _AccountMainPageState();
}

class _AccountMainPageState extends State<AccountMainPage> {
  List list1 = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(1, 1),
                    colors: <Color>[
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 46, 54, 72),
                ])),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Informasi Pengguna.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 300,
                  child: FutureBuilder(
                      future: serviceAccount(list1),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return PageView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: list1.length,
                              itemBuilder: (context, index) {
                                return CardAccount(
                                    preferensi: list1[index].preferensi,
                                    username: list1[index].username,
                                    email: list1[index].email);
                              });
                        } else {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Preferensi"),
                                  Shimmer.fromColors(
                                    baseColor: Color.fromARGB(180, 46, 54, 72),
                                    highlightColor:
                                        Color.fromARGB(255, 76, 89, 120),
                                    child: Container(
                                      width: 400,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[300]),
                                      child: Text(
                                        "",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Username"),
                                  Shimmer.fromColors(
                                    baseColor: Color.fromARGB(180, 46, 54, 72),
                                    highlightColor:
                                        Color.fromARGB(255, 76, 89, 120),
                                    child: Container(
                                      width: 400,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[300]),
                                      child: Text(
                                        "",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Email"),
                                  Shimmer.fromColors(
                                    baseColor: Color.fromARGB(180, 46, 54, 72),
                                    highlightColor:
                                        Color.fromARGB(255, 76, 89, 120),
                                    child: Container(
                                      width: 400,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[300]),
                                      child: Text(
                                        "",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountEditPage(
                                username: list1[0].username,
                                email: list1[0].email,
                                password: list1[0].password)));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 46, 54, 72)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Perbarui Data Akun",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.arrow_circle_right,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/new_user2');
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 46, 54, 72)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Ubah Preferensi Genre",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.arrow_circle_right,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountPrivacyPolice()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 46, 54, 72)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Icon(Icons.arrow_circle_right, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountTermsofService()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 46, 54, 72)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Terms of Service",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.arrow_circle_right,
                          color: Colors.white,
                        )
                      ],
                    ),
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
