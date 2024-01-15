import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Future<bool> checkSession(String sessionToken) async {
    final Dio _dio = Dio();

    try {} catch (error) {}
    return false;
  }
}
