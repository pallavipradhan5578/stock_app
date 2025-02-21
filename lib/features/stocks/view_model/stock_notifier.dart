import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/core/utills/helpers/usecases.dart';
import 'package:stoke/features/home/model/search_model.dart';
import 'package:stoke/features/stocks/repository/stock_repository.dart';

class StockNotifier extends ChangeNotifier {
  final UseCases useCases;
  StockNotifier(this.useCases);
  bool isLoading = false;
  SearchResponseDataModel? model;

  Future<void> stockDetails(BuildContext context, int id) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await useCases.executeStockDetail(id);

      isLoading = false;
      notifyListeners();

      if (response != null) {
        model = response;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went wrong!!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

final stockProvider = ChangeNotifierProvider<StockNotifier>((ref) {
  return StockNotifier(UseCases(stockRepository: StockRepository()));
});
