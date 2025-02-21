import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/core/utills/constants/color_constants.dart';
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/core/utills/helpers/usecases.dart';
import 'package:stoke/features/home/model/search_model.dart';
import 'package:stoke/features/home/repository/home_repository.dart';

class HomeNotifier extends ChangeNotifier {
  final UseCases useCases;
  HomeNotifier(this.useCases);
  final TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  List<SearchResponseDataModel>? searchResponses = [];

  Future<void> searchStocks(BuildContext context) async {
    String query = searchController.text.trim();
    if (query != "") {
      try {
        isLoading = true;
        notifyListeners();

        final response = await useCases.executeSearchStocks(query);

        isLoading = false;
        notifyListeners();

        if (response != null) {
          searchResponses = response;
          notifyListeners();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(StringConstants.somethingWentWrong),
              backgroundColor: ColorConstants.errorColor,
            ),
          );
        }
      } catch (e, _) {
        isLoading = false;
        notifyListeners();
        print("$_");
      }
    }
  }
}

final homeProvider = ChangeNotifierProvider<HomeNotifier>((ref) {
  return HomeNotifier(UseCases(homeRepository: HomeRepository()));
});
