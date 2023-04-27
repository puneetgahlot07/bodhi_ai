import 'dart:developer';

import 'package:bodhi_ai_assig/model/medi_model.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class MediData {
  static var client = http.Client();
  static Future<List<MedinieModel>?> fetchProducts() async {
    var response = await rootBundle.loadString('assets/medicine.json');
    // var response = await client.get(Uri.parse(
    //     'https://run.mocky.io/v3/f50bcc43-5a7f-4116-ad0e-4375078161b5'));
    // if (response.statusCode == 200) {
    if (response != null) {
      var jsonString = response;
      log(jsonString);
      return medinieModelFromJson(jsonString);
    } else {
      log("Error Part");
      //show error message
      return null;
    }
  }
}
