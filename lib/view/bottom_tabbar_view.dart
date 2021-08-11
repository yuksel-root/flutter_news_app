import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/notifier/bottom_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/core/notifier/connectivity_notifier.dart';
import 'package:flutter_news_app_with_api/core/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/models/news_country.dart';
import 'package:flutter_news_app_with_api/services/api_service.dart';
import 'package:flutter_news_app_with_api/view/tabbar_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'news_article_country_settings_view.dart';
import 'package:flutter_news_app_with_api/core/extension/string_extension.dart';
import 'package:flutter_news_app_with_api/core/language/locale_keys.g.dart';

class BottomTabbarView extends StatefulWidget {
  const BottomTabbarView({Key? key}) : super(key: key);

  @override
  _BottomTabbarViewState createState() => _BottomTabbarViewState();
}

final NavigationService navigation = NavigationService.instance;
void _navigateHome(context) =>
    navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);

class _BottomTabbarViewState extends State<BottomTabbarView> {
  late final List<NewsCountry>? countries;
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .listenConnectivity();
    countries = ApiService().getAllCountries();
  }

  static List<Widget> currentScreen = [
    NewsTabbarView(),
    NewsCountrySettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProvider>(context);
    final tabbarProvider = Provider.of<TabbarNavigationProvider>(context);
    return Scaffold(
      body: currentScreen[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1c0f45),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.greenAccent,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
          if (index == 0) {
            tabbarProvider.currentIndex = 0;
            _navigateHome(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              FontAwesomeIcons.home,
            ),
            label: LocaleKeys.bottomNav_tab1.locale,
          ),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.globe),
              label: LocaleKeys.bottomNav_tab2.locale),
        ],
      ),
    );
  }
}
