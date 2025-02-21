import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/core/utills/helpers/shared_pref.dart';
import 'package:stoke/features/home/model/search_model.dart';

class HomeRepository {
  Future<List<SearchResponseDataModel>> searchStocks(String query) async {
    final authToken = await SharedPref.getToken();
    final url = Uri.parse(
        'https://illuminate-production.up.railway.app/api/stocks/search?query=$query');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
    );

    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((json) => SearchResponseDataModel.fromJson(json))
          .toList();
    } else {
      throw Exception("${StringConstants.failedToLoadStock}${response.body}");
    }
  }
}
