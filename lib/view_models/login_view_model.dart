import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  static GlobalKey<FormState> formState = GlobalKey<FormState>();
  static GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController? emailController;
  TextEditingController? passwordController;

  LoginViewModel() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool _isPassOpen = false;

  bool get isPassOpen => _isPassOpen;

  void setPassOpen() {
    _isPassOpen = !_isPassOpen;
    notifyListeners();
  }

  void fetchLoginService(args) {}
}
