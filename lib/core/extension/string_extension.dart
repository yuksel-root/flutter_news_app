import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_news_app_with_api/core/constants/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail => RegExp(AppConstants.EMAIL_REGIEX).hasMatch(this)
      ? null
      : 'Email does not valid';
}
