import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/navigation/notifier/bottom_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/core/navigation/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:provider/provider.dart';

class NewsCountrySettingsViewModel with ChangeNotifier {
  final NavigationService navigation = NavigationService.instance;

  PrefsState _currentPrefs = PrefsState(
    countryIndex: 0,
  );

  NewsCountrySettingsViewModel() {
    _loadCountryPref();
  }

  void selectCountry(int countryIndex, context) {
    setCountry = countryIndex;
    var bottomProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    final tabbarNavProv =
        Provider.of<TabbarNavigationProvider>(context, listen: false);
    bottomProvider.currentIndex = 0;
    tabbarNavProv.currentIndex = 0;
  }

  Future<void> _loadCountryPref() async {
    final country = SharedManager.instance.getIntValue('Country');

    if (country == null) {
      print("null country");
      return;
    }
    _currentPrefs = PrefsState(countryIndex: country);
    notifyListeners();
  }

  Future<void> _saveCountryPref() async {
    await SharedManager.instance
        .saveIntValue('Country', _currentPrefs.countryIndex);
  }

  int get getCountryIndex {
    return _currentPrefs.countryIndex;
  }

  set setCountry(int newIndex) {
    if (newIndex == _currentPrefs.countryIndex) return;
    _currentPrefs = PrefsState(countryIndex: newIndex);
    notifyListeners();
    _saveCountryPref();
  }
}

class PrefsState {
  final int countryIndex;
  const PrefsState({
    required this.countryIndex,
  });
}
