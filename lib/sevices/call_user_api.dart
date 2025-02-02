import 'dart:convert';

import 'package:iot_sau_pm_project/condig/env.dart';
import 'package:iot_sau_pm_project/models/user.dart';
import 'package:http/http.dart' as http;

class CallUserAPI {
  //สร้างเมธอดเรียก API ที่ทำงานกับตาราง user_tb
  //สรา้งเมธอดเรียก API : insert_user_api.php
  static Future<List<User>> insertUserAPI(User user) async {
    final responseData = await http.post(
        Uri.parse(Env.baseUrl + '/insert_user_api.php'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'});

    if (responseData.statusCode == 201) {
      //แปลงข้อมูล JSON ให้เป็น List<User> เพื่อให้สามารถใช้งานได้
      final responseDataDecode = jsonDecode(responseData.body);
      print(responseDataDecode);
      final List<User> data =
          await responseDataDecode.map<User>((e) => User.fromJson(e)).toList();
      return data;
    } else {
      throw Exception('Failed to insert user' + responseData.toString());
    }
  }

  //สร้างเมธอดเรียก API ที่ทำงานกับตาราง user_tb
  static Future<List<User>> CheckUserAPI(User user) async {
    final responseData = await http.get(
        Uri.parse(Env.baseUrl +
            '/check_user_api.php?userEmail=${user.userEmail}&userName=${user.userName}&userPassword=${user.userPassword}'),
        headers: {'Content-Type': 'application/json'});

    if (responseData.statusCode == 200 || responseData.statusCode == 404) {
      //แปลงข้อมูล JSON ให้เป็น List<User> เพื่อให้สามารถใช้งานได้
      final responseDataDecode = jsonDecode(responseData.body);
      print(responseDataDecode);
      final List<User> data =
          await responseDataDecode.map<User>((e) => User.fromJson(e)).toList();
      return data;
    } else {
      throw Exception('Failed to insert user' + responseData.toString());
    }
  }
}
