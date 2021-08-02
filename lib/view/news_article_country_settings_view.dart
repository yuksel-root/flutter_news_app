import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/app_constants.dart';

class NewsCountrySettings extends StatelessWidget {
  const NewsCountrySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Select Country';

    final keyList = AppConstants.FLAGS.keys.toList();
    final items = List<ListTile>.generate(
        AppConstants.FLAGS.length, //
        (index) => ListTile(
            leading: new Image.asset(AppConstants.FLAGS[keyList[index]],
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                package: 'country_icons'),
            title: Text(keyList[index])));
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title)),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: AppConstants.FLAGS.length,
          itemBuilder: (BuildContext ctx, int index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(title: item.title, leading: item.leading),
            );
          },
        ),
      ),
    );
  }
}
