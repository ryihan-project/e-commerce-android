import 'dart:convert';
import 'dart:io';
import 'package:DeliveryBoyApp/AppTheme.dart';
import 'package:DeliveryBoyApp/api/api_util.dart';
import 'package:DeliveryBoyApp/models/DeliveryBoy.dart';
import 'package:DeliveryBoyApp/models/MyResponse.dart';
import 'package:DeliveryBoyApp/services/PushNotificationsManager.dart';
import 'package:DeliveryBoyApp/utils/InternetUtils.dart';
import 'package:DeliveryBoyApp/utils/SizeConfig.dart';
import 'package:DeliveryBoyApp/utils/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class

AuthController {


  /*-----------------   Log In     ----------------------*/

  static Future<MyResponse> loginUser(String email, String password) async {

    //Get FCM
    PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
    await pushNotificationsManager.init();
    String fcmToken = await pushNotificationsManager.getToken();

    String loginUrl = ApiUtil.MAIN_API_URL + ApiUtil.AUTH_LOGIN;

    //Body data
    Map data = {'email': email, 'password': password, 'fcm_token':fcmToken};

    //Encode
    String body = json.encode(data);


    //Check Internet
    bool isConnected = await InternetUtils.checkConnection();
    if (!isConnected) {
      return MyResponse.makeInternetConnectionError();
    }

    try{
    Response response = await http.post(loginUrl,
        headers: ApiUtil.getHeader(requestType: RequestType.Post), body: body);

    MyResponse myResponse = MyResponse(response.statusCode);
    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      Map<String, dynamic> data = json.decode(response.body);
      Map<String, dynamic> user = data['delivery_boy'];
      String token = data['token'];

      await saveUser(user);
      await sharedPreferences.setString('token', token);

      myResponse.success = true;
    } else {
      Map<String, dynamic> data = json.decode(response.body);
      myResponse.success = false;
      myResponse.setError(data);
    }

    return myResponse;
    }catch(e){
      return MyResponse.makeServerProblemError();
    }
  }



  /*-----------------   Register     ----------------------*/

  static Future<MyResponse> registerUser(String name, String email,
      String password) async {
    //Get FCM
