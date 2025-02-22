import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/common_widgets/common_theme_toggle.dart';
import 'package:stoke/common_widgets/logout_button.dart';
import 'package:stoke/core/utills/constants/color_constants.dart';
import 'package:stoke/core/utills/constants/size_constants.dart';
import 'package:stoke/core/utills/constants/string_constants.dart';
import 'package:stoke/core/utills/helpers/app_routes.dart';
import 'package:stoke/features/home/view_model/home_notifier.dart';
import '../../../common_widgets/common_text_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNotifier = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchView(homeNotifier, context),
              if (homeNotifier.isLoading)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (homeNotifier.isEmpty)
                Expanded(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/market-research.png',
                        height: 60,
                        color: ColorConstants.lightPrimaryColor,
                      ),
                      Text(StringConstants.searchHint)
                    ],
                  )),
                )
              else if (homeNotifier.searchResponses?.isNotEmpty ?? false)
                Expanded(
                  child: ListView.builder(
                    itemCount: homeNotifier.searchResponses!.length,
                    itemBuilder: (context, index) {
                      final stock = homeNotifier.searchResponses![index];
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.stock,
                          arguments: stock.id,
                        ),
                        child: Card(
                          elevation: 10,
                          margin: const EdgeInsets.all(
                              SizeConstants.smallPadding * 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                SizeConstants.smallPadding * 2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  stock.image?.url ??
                                      "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                    width: SizeConstants.mediumPadding),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        stock.name ?? "",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                          height: SizeConstants.smallPadding),
                                      Text(
                                          "${StringConstants.symbol}${stock.symbol}"),
                                      if (stock.industry?.isNotEmpty ?? false)
                                        Text(
                                            "${StringConstants.industry}${stock.industry}"),
                                      if (stock.sector?.isNotEmpty ?? false)
                                        Text(
                                            "${StringConstants.sector}${stock.sector}"),
                                      if (stock.description?.isNotEmpty ??
                                          false)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            stock.description!,
                                            style: TextStyle(
                                                color: Colors.grey.shade700),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              else
                const Expanded(
                  child: Center(child: Text(StringConstants.noStockFound)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _searchView(homeNotifier, context) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            controller: homeNotifier.searchController,
            hintText: StringConstants.searchHint,
            keyboardType: TextInputType.text,
            prefixIcon: Icon(Icons.search),
            onChanged: (value) {
              homeNotifier.searchStocks(context);
            },
          ),
        ),
        const CommonThemeToggle(),
        const LogoutButton(),
      ],
    );
  }
}
