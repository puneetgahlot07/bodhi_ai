import 'dart:ui' as ui;

import 'package:bodhi_ai_assig/screen/home.dart';
import 'package:bodhi_ai_assig/screen/otp.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    getCheck();
  }

  var uid;
  getCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid");
    if (uid != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, Home.routeName, (route) => false);

      // Navigator.pushNamed(context, Home.routeName);
    }
  }

  final _CheckNo = GlobalKey<FormState>();
  TextEditingController _mobileNo = TextEditingController();

// bool getOtp = true;
// bool getPassword = true;
  bool noValid = false, loading = false, cHeigth = false;
  bool loadNext = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const DelayedDisplay(
                      delay: Duration(milliseconds: 300),
                      child: Text("Welcome",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 90,
                        child: Stack(
                          alignment: const Alignment(0, 0),
                          children: <Widget>[
                            Form(
                              key: _CheckNo,
                              child: Container(
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(15, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        maxLength: 10,
                                        controller: _mobileNo,
                                        style: const TextStyle(fontSize: 18),
                                        // obscureText: true,
                                        onChanged: (val) {
                                          setState(() {
                                            _mobileNo.text;
                                          });
                                        },
                                        validator: (val) {
                                          if (val!.length == 10) {
                                            setState(() {
                                              cHeigth = false;
                                            });
                                            return null;
                                          } else {
                                            setState(() {
                                              cHeigth = true;
                                            });
                                            return "Enter Valid Number";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            counterText: "",
                                            border: InputBorder.none,
                                            // labelText: 'Phone Number',

                                            hintText: "Phone Number",
                                            icon: TextButton.icon(
                                                onPressed: () async {},
                                                icon: ShaderMask(
                                                  blendMode: BlendMode.srcIn,
                                                  shaderCallback:
                                                      (Rect bounds) {
                                                    return ui.Gradient.linear(
                                                      const Offset(10.0, 50.0),
                                                      const Offset(24.0, 4.0),
                                                      [
                                                        const Color(0xFFB858A2),
                                                        const Color(0xFFFAA61A)
                                                      ],
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.phone_android_rounded,
                                                    size: 28,
                                                    // color: Colors.black,
                                                  ),
                                                ),
                                                label: const Text(
                                                  "+91",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ))),
                                      ))),
                            ),
                            Positioned(
                                // top: 0,
                                right: 0,
                                child: loadNext == true
                                    ? Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          // borderRadius:
                                          //     BorderRadius.circular(20.0),
                                          color: Colors.grey,
                                        ),
                                        child: const Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.black,
                                        )),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          if (_CheckNo.currentState!
                                              .validate()) {
                                            // setState(() {
                                            //   loadNext = true;
                                            // });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SendCode(
                                                          phone: _mobileNo.text
                                                              .trim(),
                                                        )));
                                            //     (route) => false);
                                            // FirebaseFirestore.instance
                                            //     .collection('user')
                                            //     .where('number',
                                            //         isEqualTo: _mobileNo
                                            //             .text
                                            //             .trim())
                                            //     .get()
                                            //     .then((value) {
                                            //   // print(value.docs);
                                            //   // print(
                                            //   //     value.docs.isNotEmpty);
                                            //   // setState(() {
                                            //   //   loadNext = false;
                                            //   // });
                                            //   if (value.docs.isNotEmpty) {
                                            //     setState(() {
                                            //       loadNext = false;
                                            //     });
                                            //     // login part

                                            //     Navigator.push(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 LoginPage(
                                            //                     no: _mobileNo
                                            //                         .text
                                            //                         .trim())));
                                            //   } else {
                                            //     setState(() {
                                            //       loadNext = false;
                                            //     });
                                            //     // sign up
                                            //     Navigator.push(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder:
                                            //                 (context) =>
                                            //                     GetCheck(
                                            //                       no: _mobileNo
                                            //                           .text
                                            //                           .trim(),
                                            //                     )));
                                            //   }
                                            // });
                                          }
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 52,
                                          decoration: _mobileNo.text.length ==
                                                  10
                                              ? BoxDecoration(
                                                  // color: Colors.grey,
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      colors: [
                                                        Color(0xFFB858A2),
                                                        Color(0xFFFAA61A)
                                                      ]),
                                                )
                                              : BoxDecoration(
                                                  color: Colors.grey,
                                                ),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
