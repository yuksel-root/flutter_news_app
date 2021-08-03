import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_route.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'view_models/bottom_navigation_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.instance.initPreferences();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => BottomNavigationProvider(),
      ),
      Provider.value(value: NavigationService.instance)
    ], child: MyApp()),
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
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: NavigationConstants.HOME_VIEW,
    );
  }
}
