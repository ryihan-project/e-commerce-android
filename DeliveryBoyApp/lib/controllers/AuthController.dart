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
