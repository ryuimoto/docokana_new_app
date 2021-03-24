import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:docokana_new_app/util/color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../Welcome.dart';

class Verification extends StatefulWidget {
  final String phoneNumber;

  Verification(this.phoneNumber);

  @override
  _VerificationState createState() => _VerificationState();
}

var onTapRecognizer;

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 100),
                width: 300,
                child: SvgPicture.asset(
                  "asset/auth/verifyOtp.svg",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
              child: RichText(
                text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                          text: widget.phoneNumber,
                          style: TextStyle(
                              color: primaryColor,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic,
                              fontSize: 15)),
                    ],
                    style: TextStyle(color: Colors.black54, fontSize: 15)),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: PinCodeTextField(
                textInputType: TextInputType.number,
                length: 4,
                obsecureText: false,
                animationType: AnimationType.fade,
                shape: PinCodeFieldShape.underline,
                animationDuration: Duration(milliseconds: 300),
                fieldHeight: 50,
                fieldWidth: 40,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Didn't receive the code? ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  children: [
                    TextSpan(
                        text: " RESEND",
                        recognizer: onTapRecognizer,
                        style: TextStyle(
                            color: Color(0xFF91D3B3),
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ]),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
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
                  height: MediaQuery.of(context).size.height * .065,
                  width: MediaQuery.of(context).size.width * .75,
                  child: Center(
                      child: Text(
                    "VERIFY",
                    style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ))),
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Welcome()));
                      });
                      return Center(

                          // Aligns the container to center
                          child: Container(
                              // A simplified version of dialog.
                              width: 180.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "asset/auth/verified.jpg",
                                    height: 100,
                                  ),
                                  Text(
                                    "Verified\n Successfully",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 20),
                                  )
                                ],
                              )));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
