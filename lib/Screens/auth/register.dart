import 'dart:convert';
import 'package:docokana_new_app/Screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:docokana_new_app/Screens/Tab.dart';
import 'package:docokana_new_app/util/color.dart';
import 'package:docokana_new_app/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  var fname;
  var lname;
  var phone;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMsg(msg) {
    print(msg);

    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Colors.white),
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        darkPrimaryColor,
                        primaryColor.withOpacity(.15)
                      ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        darkPrimaryColor,
                        primaryColor.withOpacity(.2)
                      ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          SvgPicture.asset(
                            "asset/hookup4u-Logo-BW.svg",
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [primaryColor, primaryColor])),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(fontSize: 23),
                          decoration: InputDecoration(
                            hintText: "Email",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            helperText: "This is how it will appear in App.",
                            helperStyle:
                                TextStyle(color: secondryColor, fontSize: 15),
                          ),
                          onChanged: (value) {},
                          validator: (emailValue) {
                            if (emailValue.isEmpty) {
                              return 'Please enter email';
                            }
                            email = emailValue;
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(fontSize: 23),
                          decoration: InputDecoration(
                            hintText: "First Name",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            helperText: "This is how it will appear in App.",
                            helperStyle:
                                TextStyle(color: secondryColor, fontSize: 15),
                          ),
                          onChanged: (value) {},
                          validator: (fnameValue) {
                            if (fnameValue.isEmpty) {
                              return 'Please enter first name';
                            }
                            fname = fnameValue;
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(fontSize: 23),
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            helperText: "This is how it will appear in App.",
                            helperStyle:
                                TextStyle(color: secondryColor, fontSize: 15),
                          ),
                          onChanged: (value) {},
                          validator: (lnameValue) {
                            if (lnameValue.isEmpty) {
                              return 'Please enter last name';
                            }
                            lname = lnameValue;
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(fontSize: 23),
                          decoration: InputDecoration(
                            hintText: "Phone",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            helperText: "This is how it will appear in App.",
                            helperStyle:
                                TextStyle(color: secondryColor, fontSize: 15),
                          ),
                          onChanged: (value) {},
                          validator: (phoneValue) {
                            if (phoneValue.isEmpty) {
                              return 'Please enter phone';
                            }
                            phone = phoneValue;
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(fontSize: 23),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            helperText: "This is how it will appear in App.",
                            helperStyle:
                                TextStyle(color: secondryColor, fontSize: 15),
                          ),
                          onChanged: (value) {},
                          validator: (passwordValue) {
                            if (passwordValue.isEmpty) {
                              return 'Please enter password';
                            }
                            password = passwordValue;
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: InkWell(
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          primaryColor.withOpacity(.5),
                                          primaryColor.withOpacity(.8),
                                          primaryColor,
                                          primaryColor
                                        ])),
                                height:
                                    MediaQuery.of(context).size.height * .065,
                                width: MediaQuery.of(context).size.width * .8,
                                child: Center(
                                    child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                ))),
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                _register();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
                        child: Text(
                          'Already Have an Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': email,
      'password': password,
      'phone': phone,
      'fname': fname,
      'lname': lname
    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      print('success!!!!');
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Tabbar()),
      );
    } else {
      // print(body['message']);
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
