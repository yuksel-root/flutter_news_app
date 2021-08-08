import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/language/language_manager.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/notifier/bottom_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/core/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsCountrySettingsViewModel with ChangeNotifier {
  final NavigationService navigation = NavigationService.instance;

  CountryPrefsState _countryCurrentPrefs = CountryPrefsState(
    countryIndex: 0,
  );

  NewsCountrySettingsViewModel() {
    _loadCountryPref();
  }

  void changeLanguage(BuildContext context) {
    switch (getCountryIndex) {
      case 0:
        context.setLocale(LanguageManager.instance.trLocale);
        notifyListeners();
        break;
      default:
        context.setLocale(LanguageManager.instance.enLocale);
        notifyListeners();
    }
  }

  void selectCountry(int countryIndex, BuildContext context) {
    final bottomProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    final tabbarNavProv =
        Provider.of<TabbarNavigationProvider>(context, listen: false);

    setCountryIndex = countryIndex;
    changeLanguage(context);

    bottomProvider.currentIndex = 0;
    tabbarNavProv.currentIndex = 0;

    notifyListeners();
  }

  Future<void> _loadCountryPref() async {
    final country = SharedManager.instance.getIntValue('Country');
    if (country == null) {
      print("null country");
      return;
    }
    _countryCurrentPrefs = CountryPrefsState(countryIndex: country);
    notifyListeners();
  }

  Future<void> _saveCountryPref() async {
    await SharedManager.instance
        .saveIntValue('Country', _countryCurrentPrefs.countryIndex);
  }

  int get getCountryIndex {
    return _countryCurrentPrefs.countryIndex;
  }

  set setCountryIndex(int newIndex) {
    if (newIndex == _countryCurrentPrefs.countryIndex) return;
    _countryCurrentPrefs = CountryPrefsState(countryIndex: newIndex);
    notifyListeners();
    _saveCountryPref();
  }
}

class CountryPrefsState {
  final int countryIndex;
  const CountryPrefsState({
    required this.countryIndex,
  });
}
