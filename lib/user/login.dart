import 'dart:convert';

import 'package:becalm_mobile/user/register.dart';
import 'package:becalm_mobile/utils/HttpService.dart';
import 'package:becalm_mobile/utils/UserSecureStorage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/User.dart';
import '../todo/Dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keyForm = GlobalKey<FormState>();
  User user = User("wojtekgrelewicz", "qqqqqqqq");
  HttpService httpService = HttpService();
  UserSecureStorage storage = new UserSecureStorage();

  Future save() async {
    var res = await httpService.post(Uri.parse("auth/signin"),
        body: jsonEncode({"username": user.email, "password": user.password}));
    Map<String, dynamic> hashMap;
    if (res.statusCode == 200) {
      hashMap = json.decode(res.body);
      httpService.appendHeaders(hashMap['token']);
      UserSecureStorage.setJwtKey(hashMap['token']);
      UserSecureStorage.setEmail(hashMap['email']);
      UserSecureStorage.setRefreshToken(hashMap['refreshToken']);
      UserSecureStorage.setUserName(hashMap['userName']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: keyForm,
            child: Column(children: [
              Container(
                height: (MediaQuery.of(context).size.height),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.black,
                        offset: Offset(1, 5))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text("Login",
                          style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold,
                              fontSize: 42,
                              color: Colors.black)),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(175, 175, 175, 1),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.5)
                            ]),
                        child: TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Hasło",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(175, 175, 175, 1),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.5)
                            ]),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          obscureText: true,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 220,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.circular(16.0),
                        ),
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () {
                            save();
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30.0,
                              ),
                              Icon(
                                Icons.lock_open,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Zaloguj się',
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),

                        ),
                      ),
                      Container(
                        height: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            "Zarejestruj się",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
