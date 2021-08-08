import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/notifier/bottom_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/core/notifier/connectivity_notifier.dart';
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

class _BottomTabbarViewState extends State<BottomTabbarView> {
  static List<Widget> currentScreen = [
    NewsTabbarView(),
    NewsCountrySettingsView(),
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .listenConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: currentScreen[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1c0f45),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.greenAccent,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
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
