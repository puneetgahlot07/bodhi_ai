import 'dart:convert';
import 'dart:developer';

import 'package:bodhi_ai_assig/screen/home.dart';
import 'package:bodhi_ai_assig/services/medi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/medi_model.dart';

class Controllergetx extends GetxController {
  var userid = "".obs;
  String get _user => userid.value;
  var userId = "".obs;
  String get _userId => userId.value;
  var statusotp = "Hello".obs;

  String get _statusotp => statusotp.value;
  // var medicineList = <MedicineModel>[].obs;
  // List<MedicineModel>? get _medicineList => [...medicineList.value];
  RxList<MedinieModel> mediniedata = <MedinieModel>[].obs;

  otpVerfication(String number) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91$number',
          verificationCompleted: (PhoneAuthCredential credential) async {},
          verificationFailed: (FirebaseAuthException e) {
            statusotp.value = "Invaild Otp";
          },
          codeSent: (String verficationID, int? resendToken) async {
            userId.value = verficationID;
          },
          codeAutoRetrievalTimeout: (String verificationID) {},
          timeout: Duration(seconds: 120));
    } catch (e) {
      log(e.toString());
    }
  }

  GetUserCred(String pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: userId.value, smsCode: pin))
          .then((value) async {
        userid.value = value.user!.uid;
      });
    } catch (e) {
      log("GetUserCred Error -> $e");
    }
  }

  SaveData(String username, String email, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseFirestore.instance.collection('user').doc(userid.value).set({
      'uid': userid.value,
      'name': username,
      'email': email,
      'userType': 'user'
    }).then((res) async {
      // Obtain shared preferences.
      await prefs.setString('uid', userId.value);
      await prefs.setString('username', username);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
      // Navigator.pushNamed(context, )
    });
  }

  GetData() async {
    try {
      var data = await MediData.fetchProducts();
      if (data != null) {
        mediniedata.value = data;
      }
      // var response = await http.get(Uri.parse(
      //     "https://run.mocky.io/v3/f50bcc43-5a7f-4116-ad0e-4375078161b5"));

      // log(response.statusCode.toString());
      // if (response.statusCode == 200) {
      //   // log(response.body);
      //   var jsonString = response.body;

      //   // log(res);
      //   // mediniedata.value = medinieModelFromJson(jsonString);

      //   // medicineList.value = res as List<MedicineModel>;
      // }
    } catch (e) {
      log(e.toString());
      log("Api Not Fatch");
    }
  }
}
