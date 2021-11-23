import 'package:becalm_mobile/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keyForm = GlobalKey<FormState>();

  Future save() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            child: Column(children: [
          Container(
            height: (MediaQuery.of(context).size.height),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(240, 240, 240, 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2, color: Colors.black, offset: Offset(1, 5))
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
                        "Password",
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
                      color: Color.fromRGBO(52, 51, 56, 1),
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
                            width: 50.0,
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
                            'Login',
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),

                      /*Icon(
                        Icons.lock_open,
                        color: Colors.white,
                        size: 30,
                      ),*/
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
                        "Dont have Account ?",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.lightBlueAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
