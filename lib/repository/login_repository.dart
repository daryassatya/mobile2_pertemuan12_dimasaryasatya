import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:tugas_pertemuan12_dimasaryasatya/repository/repository.dart';

class LoginRepository extends Repository {
  Future<bool> checkSession(String sessionToken) async {
    final Dio _dio = Dio();
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String sessionToken = prefs.getString('session') ?? "";

      FormData formData = FormData.fromMap({'session_token': sessionToken});

      final response = await _dio.post(
        'https://auth-daryas.000webhostapp.com/session.php',
        data: formData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.data);
        return data['status'] == 'success';
      }
    } catch (error) {
      // Handle exceptions h  ere
      print("Error: $error");
    }

    // Default return if there's an error
    return false;
  }

  Future logout() async {
    final Dio _dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sessionToken = prefs.getString('session') ?? "";
    Map fdataMap = {'session_token', sessionToken};
    FormData fdata = FormData();
    final response = await _dio.post(
      'https://auth-daryas.000webhostapp.com/logout.php',
      data: fdata,
    );
    prefs.remove('session_token');
  }
}
