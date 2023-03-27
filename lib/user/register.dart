import 'dart:convert';

import 'package:becalm_mobile/utils/HttpService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final keyForm = GlobalKey<FormState>();
  HttpService httpService = HttpService();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _surnameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _rePasswordController = new TextEditingController();

  Future save() async {
    var res = await httpService.post(Uri.parse("auth/signup"),
        body: jsonEncode({
          "firstName": _firstNameController.text,
          "surname": _surnameController.text,
          "password": _passwordController.text,
          "email": _emailController.text,
          "username": _userNameController.text
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          child: Column(
            children: [
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text("Rejestracja",
                          style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black)),
                      SizedBox(
                        height: 5,
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
                        height: 40,
                        width: 320,
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
                          controller: _emailController,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Nazwa użytkownika",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Container(
                        height: 40,
                        width: 320,
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
                          controller: _userNameController,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Imię",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Container(
                        height: 40,
                        width: 320,
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
                          controller: _firstNameController,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Nazwisko",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Container(
                        height: 40,
                        width: 320,
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
                          controller: _surnameController,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
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
                        height: 40,
                        width: 320,
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
                          controller: _passwordController,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Powtórz hasło",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Container(
                        height: 40,
                        width: 320,
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
                          controller: _rePasswordController,
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
                            color: Colors.blueAccent,
                            borderRadius: new BorderRadius.circular(16.0),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          child: TextButton(
                              onPressed: () {
                                singup(
                                    _emailController.text,
                                    _userNameController.text,
                                    _firstNameController.text,
                                    _surnameController.text,
                                    _passwordController.text,
                                    _rePasswordController.text);
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 53.0,
                                  ),
                                  Text(
                                    'Zarejestruj',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  singup(email, userName, firstname, surname, password, repassword) async {
    Map<String, String> header = {
      'Content-Type': 'application/json-patch+json',
    };

    Map data = {
      'email': email,
      'username': userName,
      'firstName': firstname,
      'password': password,
      'surname': surname
    };

    var post = await http.post(Uri.parse("http://10.0.2.2:8080/auth/signup"),
        headers: header, body: jsonEncode(data));

    if (post.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
