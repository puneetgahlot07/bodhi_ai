import 'package:bodhi_ai_assig/controller/getxcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/instance_manager.dart';
import 'package:pinput/pinput.dart';
import 'package:get/state_manager.dart';
import 'package:validators/validators.dart';

class SendCode extends StatefulWidget {
  String phone;
  SendCode({Key? key, required this.phone}) : super(key: key);

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final _SignUpKey = GlobalKey<FormState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  void patten() {
    String no1 = widget.phone[0], no2 = widget.phone[8];
    for (var i = 0; i <= widget.phone.length; i++) {
      if (i > 0 && i < 3) {
        no1 = no1 + widget.phone[i];
      }
      if (i > 8 && i < 10) {
        no2 = no2 + widget.phone[i];
      }
    }
    setState(() {
      no = '$no1*****$no2';
    });
  }

  String? no;
  final Controllergetx pcontroller = Get.put(Controllergetx());
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    patten();
    Future.delayed(Duration.zero);
    pcontroller.otpVerfication(widget.phone);
    // _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    print(widget.phone);
    return Scaffold(
      key: _scaffoldkey,
      // appBar: AppBar(
      //   title: Text('OTP Verification'),
      // ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Obx(() => pcontroller.userid.value == ""
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Phone Number Verification",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter the code sent to +91 $no",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 40),
                    //   child: Center(
                    //     child: Text(
                    //       'Verify +91-${widget.phone}',
                    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Pinput(
                        // fieldsCount: 6,
                        length: 6,

                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,

                        pinAnimationType: PinAnimationType.fade,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        showCursor: true,
                        onCompleted: (pin) async {
                          pcontroller.GetUserCred(pin);
                          // try {
                          //   await FirebaseAuth.instance
                          //       .signInWithCredential(PhoneAuthProvider.credential(
                          //           verificationId: _verificationCode!, smsCode: pin))
                          //       .then((value) async {
                          //     if (value.user != null) {
                          //       // Navigator.pushAndRemoveUntil(
                          //       //     context,
                          //       //     MaterialPageRoute(
                          //       //         builder: (context) => CreateUserPass(
                          //       //               id: value.user!.uid,
                          //       //               number: widget.phone!,
                          //       //             )),
                          //       //     (route) => false);
                          //     }
                          //   });
                          // } catch (e) {
                          //   FocusScope.of(context).unfocus();
                          //   Fluttertoast.showToast(
                          //     msg: "Invalid OTP",
                          //   );
                          //   // _scaffoldkey.currentState!
                          //   //     .showSnackBar(const SnackBar(content: Text('invalid OTP')));
                          // }
                        },
                      ),
                    )
                  ],
                )
              : Form(
                  key: _SignUpKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: usernameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            icon: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Plz Field Username*';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            icon: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              !isEmail(val!.trim()) ? "Invalid Email" : null,
                        ),
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(colors: [
                                Color(0xFF5044D4),
                                Color(0xFF6224C5)
                              ])),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  alignment: Alignment.center,
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 135),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )),
                              onPressed: () async {
                                if (_SignUpKey.currentState!.validate()) {
                                  pcontroller.SaveData(
                                      usernameController.text.trim(),
                                      emailController.text.trim(),
                                      context);
                                }
                              },
                              child: Text("Save"))),
                    ],
                  ),
                )),
        ),
      )),
    );
  }

  _verifyPhone() async {
    // print("_______________________________");
    // print(widget.phone);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              //  Navigator.of(context).pushReplacement(
              //                           MaterialPageRoute(
              //                               builder: (context) =>
              //                                   ));
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => CreateUserPass(
              //               id: value.user!.uid,
              //               number: widget.phone!,
              //             )),
              //     (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
}
