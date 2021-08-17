import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/core/network/network_service.dart';
import 'package:flutter_news_app_with_api/core/notifier/connectivity_notifier.dart';
import 'package:flutter_news_app_with_api/core/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/models/news_categories.dart';
import 'package:flutter_news_app_with_api/models/news_country.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:flutter_news_app_with_api/view_models/news_country_settings_view_model.dart';
import 'package:provider/provider.dart';
import 'news_article_view.dart';
import 'package:flutter_news_app_with_api/core/extension/string_extension.dart';

class NewsTabbarView extends StatefulWidget {
  final List<NewsCategory>? categories;
  final List<NewsCountry>? countries;
  NewsTabbarView({Key? key, this.categories, this.countries}) : super(key: key);

  @override
  _NewsTabbarViewState createState() => _NewsTabbarViewState();
}

class _NewsTabbarViewState extends State<NewsTabbarView>
    with TickerProviderStateMixin {
  late TabController tabController;
  var getCountryIndex;
  late List<NewsCategory>? categories;
  late List<NewsCountry>? countries;
  final NetworkService networkManager = NetworkService.instance;
  @override
  void initState() {
    super.initState();
    categories = ApiConstants().getAllCategories();
    countries = ApiConstants().getAllCountries();
    getCountryIndex =
        Provider.of<NewsCountrySettingsViewModel>(context, listen: false)
            .getCountryIndex;
    tabController = TabController(length: categories!.length, vsync: this);
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlinesByCountry(countries!
            .map((country) => country.countryCode!)
            .elementAt(getCountryIndex));
    Provider.of<ConnectivityProvider>(context, listen: false)
        .listenConnectivity();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabbarNavProv = Provider.of<TabbarNavigationProvider>(context);
    final listViewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: false);
    final countrySettingsModel =
        Provider.of<NewsCountrySettingsViewModel>(context, listen: false);
    //developer.log("tab" + countrySettingsModel.getCountryIndex.toString());
    return DefaultTabController(
      length: categories!.length,
      initialIndex: tabbarNavProv.currentIndex,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            tabbarNavProv.currentIndex = tabController.index;
            listViewModel.topHeadlinesCategoryWithCountry(
                countries!
                    .map((country) => country.countryCode!)
                    .elementAt(countrySettingsModel.getCountryIndex),
                categories!
                    .map((categori) => categori.categoryCode)
                    .elementAt(tabbarNavProv.currentIndex));
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('News App')),
            bottom: TabBar(
              indicatorColor: Colors.greenAccent,
              isScrollable: true,
              tabs: categories!
                  .map(
                    (e) => Tab(text: e.categoryName.toString().locale),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(
                categories!.length, (index) => NewsView()),
          ),
        );
      }),
    );
  }
}
