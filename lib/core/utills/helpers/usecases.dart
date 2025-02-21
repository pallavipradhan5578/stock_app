import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/features/auth/model/login_model.dart';
import 'package:stoke/features/auth/repository/login_repository.dart';
import 'package:stoke/features/home/model/search_model.dart';
import 'package:stoke/features/home/repository/home_repository.dart';
import 'package:stoke/features/stocks/repository/stock_repository.dart';

class UseCases {
  LoginRepository? repository;
  HomeRepository? homeRepository;
  StockRepository? stockRepository;

  UseCases({this.repository,this.homeRepository,this.stockRepository});

  /// Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.emptyEmailMsg;
    } else if (!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
        .hasMatch(value)) {
      return StringConstants.validEmailMsg;
    }
    return null;
  }

  /// Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.emptyPasswordMsg;
    } else if (value.length < 6) {
      return StringConstants.validPasswordMsg;
    }
    return null;
  }

  /// Login api call
  Future<LoginResponseDataModel>? executeLogin(String email, String password) {
    return repository?.login(email, password);
  }

  /// Search Stocks api call
  Future<List<SearchResponseDataModel>>? executeSearchStocks(String query) {
    return homeRepository?.searchStocks(query);
  }

  /// Stocks detail api call
  Future<SearchResponseDataModel>? executeStockDetail(int id) {
    return stockRepository?.fetchStockDetails(id);
  }
}
