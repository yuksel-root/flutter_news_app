import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/app_constants.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_route.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'core/language/language_manager.dart';
import 'core/navigation/notifier/provider_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.instance.initPreferences();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: EasyLocalization(
          child: MyApp(),
          supportedLocales: LanguageManager.instance.supportedLocales,
          path: AppConstants.LANG_ASSET_PATH,
          startLocale: LanguageManager.instance.trLocale,
        )),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.greenAccent,
      title: 'Flutter News App',
      theme: ThemeData(
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.greenAccent)),
          appBarTheme: AppBarTheme(
              color: Color(0xff1c0f45),
              elevation: 0,
              actionsIconTheme: IconThemeData(color: Colors.white)),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: NavigationConstants.HOME_VIEW,
    );
  }
}
