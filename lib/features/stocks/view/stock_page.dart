import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/core/utills/constants/size_constants.dart';
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/features/stocks/view_model/stock_notifier.dart';

class StockPage extends ConsumerStatefulWidget {
  final int stockId;
  const StockPage({Key? key, required this.stockId}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends ConsumerState<StockPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(stockProvider).stockDetails(context, widget.stockId));
  }

  @override
  Widget build(BuildContext context) {
    final stockNotifier = ref.watch(stockProvider);
    final stock = stockNotifier.model;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text(
          StringConstants.stockDetail,
          style: TextStyle(fontSize: 16),
        ),
        iconTheme: const IconThemeData(size: 18),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: stockNotifier.isLoading
              ? const Center(child: CircularProgressIndicator())
              : stock == null
                  ? const Center(child: Text(StringConstants.stockNotAvailable))
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            stock.image?.url ??
                                "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 1,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: SizeConstants.mediumPadding,
                          ),
                          Text(
                            stock.name ?? "",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _stockDetailRow(StringConstants.symbol, stock.symbol),
                          _stockDetailRow(
                              StringConstants.industry, stock.industry),
                          _stockDetailRow(StringConstants.sector, stock.sector),
                          if (stock.description?.isNotEmpty ?? false)
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                stock.description!,
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  Widget _stockDetailRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text("$label$value"),
    );
  }
}
