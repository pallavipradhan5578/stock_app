import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/core/utills/helpers/shared_pref.dart';
import 'package:stoke/features/home/model/search_model.dart';

class StockRepository {
  Future<SearchResponseDataModel> fetchStockDetails(int stockId) async {
    final authToken = await SharedPref.getToken();
    final url = Uri.parse(
        'https://illuminate-production.up.railway.app/api/stocks/$stockId');
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
      return SearchResponseDataModel.fromJson(data);
    } else {
      throw Exception("${StringConstants.failedToLoadStock}${response.body}");
    }
  }
}
