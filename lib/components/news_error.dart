import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';

class NewsError extends StatelessWidget {
  final errorText;
  final refreshText;
  NewsError({Key? key, required this.errorText, required this.refreshText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.dynamicWidth(1));
    return Center(
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              errorText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Colors.white, fontSize: context.dynamicWidth(0.04)),
            ),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            Text(
              refreshText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Colors.white, fontSize: context.dynamicWidth(0.04)),
            ),
          ],
        ),
      ),
    );
  }
}
