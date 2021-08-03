import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/image_constants.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';

//TODO add onTap functionality and provider

class NewsCountrySettings extends StatelessWidget {
  const NewsCountrySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Select Country';

    final keyList = ImageConstants.FLAGS.keys.toList();
    final items = List<ListTile>.generate(
      ImageConstants.FLAGS.length,
      (index) => ListTile(
        leading: Container(
            padding: EdgeInsets.all(0.001),
            margin: EdgeInsets.all(0.001),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    context.dynamicWidth(0.065) < 50
                        ? context.dynamicWidth(0.065)
                        : 50),
                border: Border.all(color: Colors.grey, width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  context.dynamicWidth(0.065) < 50
                      ? context.dynamicWidth(0.065)
                      : 50),
              child: new Image.asset(ImageConstants.FLAGS[keyList[index]],
                  height: context.dynamicWidth(0.065) < 50
                      ? context.dynamicWidth(0.065)
                      : 50,
                  width: context.dynamicWidth(0.065) < 50
                      ? context.dynamicWidth(0.065)
                      : 50,
                  fit: BoxFit.cover),
            )),
        title: Text(
          keyList[index],
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Colors.grey),
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
      title: title,
      home: Scaffold(
        backgroundColor: Color(0xe61c0f45),
        appBar: AppBar(
          backgroundColor: Color(0xff1c0f45),
          title: Center(child: Text(title)),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: ImageConstants.FLAGS.length,
          itemBuilder: (BuildContext ctx, int index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListTile(title: item.title, leading: item.leading),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
