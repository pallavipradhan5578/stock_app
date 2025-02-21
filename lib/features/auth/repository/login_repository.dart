import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stoke/features/auth/model/login_model.dart';

class LoginRepository {
  Future<LoginResponseDataModel> login(
      String identifier, String password) async {
    final url = Uri.parse(
        'https://illuminate-production.up.railway.app/api/auth/local');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"identifier": identifier, "password": password}),
    );

    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return LoginResponseDataModel.fromJson(data);
    } else {
      return LoginResponseDataModel.fromJson(data);
    }
  }
}
