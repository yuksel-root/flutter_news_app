import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_error.dart';
import 'package:flutter_news_app_with_api/core/constants/country_constants.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';
import 'package:flutter_news_app_with_api/core/language/locale_keys.g.dart';
import 'package:flutter_news_app_with_api/core/notifier/connectivity_notifier.dart';
import 'dart:developer' as developer;
import 'package:flutter_news_app_with_api/view_models/news_country_settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app_with_api/core/extension/string_extension.dart';

class NewsCountrySettingsView extends StatelessWidget {
  NewsCountrySettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = LocaleKeys.newsCountrySettings_title;
    final countryModel =
        Provider.of<NewsCountrySettingsViewModel>(context, listen: false);
    developer.log("imageWidth " + context.dynamicWidth(0.065).toString());
    developer.log("totalWidth " + context.dynamicWidth(1).toString());

    final items = List<ListTile>.generate(
      CountryConstants.listCountry.length,
      (index) => ListTile(
        leading: Container(
            height: context.dynamicWidth(0.065) < 44
                ? context.dynamicWidth(0.065)
                : 44,
            width: context.dynamicWidth(0.065) < 44
                ? context.dynamicWidth(0.065)
                : 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    context.dynamicWidth(0.065) < 40
                        ? context.dynamicWidth(0.065)
                        : 50),
                border: Border.all(color: Colors.grey, width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  context.dynamicWidth(0.065) < 40
                      ? context.dynamicWidth(0.065)
                      : 50),
              child: new Image.asset(
                  CountryConstants.listCountry[index]['imagePath'],
                  height: context.dynamicWidth(0.065),
                  width: context.dynamicWidth(0.065),
                  fit: BoxFit.cover),
            )),
        title: Text(
          CountryConstants.listCountry[index]['countryName'].toString().locale,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.greenAccent),
        ),
      ),
      title: title.toString().locale,
      home: Scaffold(
        backgroundColor: Color(0xe61c0f45),
        appBar: AppBar(
          backgroundColor: Color(0xff1c0f45),
          title: Center(child: Text(title.toString().locale)),
        ),
        body: context.watch<ConnectivityProvider>().isConnected == true
            ? ListView.separated(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: CountryConstants.listCountry.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final item = items[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () =>
                              countryModel.selectCountry(index, context),
                          child: ListTile(
                              title: item.title, leading: item.leading)),
                    ],
                  );
                },
                separatorBuilder: (BuildContext ctx, int index) => Divider(
                      color: Colors.grey,
                    ))
            : NewsError(
                errorText: LocaleKeys.errors_noInternetError_text.locale,
                refreshText: LocaleKeys.refreshScreen_text.locale,
              ),
      ),
    );
  }
}
