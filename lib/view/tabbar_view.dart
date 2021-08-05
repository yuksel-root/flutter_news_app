import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/categories_constants.dart';
import 'package:flutter_news_app_with_api/core/constants/country_constants.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:flutter_news_app_with_api/core/navigation/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/view_models/news_country_settings_view_model.dart';
import 'package:provider/provider.dart';
import 'news_article_view.dart';

class NewsTabbarView extends StatefulWidget {
  NewsTabbarView({Key? key}) : super(key: key);

  @override
  _NewsTabbarViewState createState() => _NewsTabbarViewState();
}

class _NewsTabbarViewState extends State<NewsTabbarView>
    with TickerProviderStateMixin {
  late TabController tabController;
  var getCountryIndex;
  @override
  void initState() {
    super.initState();
    getCountryIndex =
        Provider.of<NewsCountrySettingsViewModel>(context, listen: false)
            .getCountryIndex;
    tabController = TabController(
        length: CategoriesConstants.listCategory.length, vsync: this);
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlinesByCountry(
            CountryConstants.listCountry[getCountryIndex]['countryCode']);
    Provider.of<TabbarNavigationProvider>(context, listen: false);
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
      length: CategoriesConstants.listCategory.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            listViewModel.topHeadlinesCategory(
                CountryConstants
                        .listCountry[countrySettingsModel.getCountryIndex]
                    ['countryCode'],
                CategoriesConstants.listCategory[tabController.index]
                    ['categoryCode']);
            tabbarNavProv.currentIndex = tabController.index;
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('News App')),
            bottom: TabBar(
              indicatorColor: Colors.greenAccent,
              isScrollable: true,
              tabs: CategoriesConstants.listCategory
                  .map(
                    (e) => Tab(text: e['categoryName']),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(
                CategoriesConstants.listCategory.length, (index) => NewsView()),
          ),
        );
      }),
    );
  }
}
