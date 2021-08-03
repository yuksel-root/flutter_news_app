import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/view/tabbar_view.dart';
import 'package:flutter_news_app_with_api/core/navigation/notifier/bottom_navigation_notifier.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'news_article_country_settings_view.dart';

class BottomTabbarView extends StatefulWidget {
  const BottomTabbarView({Key? key}) : super(key: key);

  @override
  _BottomTabbarViewState createState() => _BottomTabbarViewState();
}

class _BottomTabbarViewState extends State<BottomTabbarView> {
  static List<Widget> currentScreen = [
    NewsTabbarView(),
    NewsCountrySettings(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationProvider>(context);
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.globe),
            label: 'Countries Settings',
          ),
        ],
      ),
    );
  }
}
