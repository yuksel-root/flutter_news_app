import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';
import 'package:flutter_news_app_with_api/core/extension/string_extension.dart';
import 'package:flutter_news_app_with_api/view_models/login_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: LoginViewModel.scaffoldState,
        backgroundColor: Color(0xfff1f3f8),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: context.mediaQuery.size.height,
              child: Column(
                children: [
                  buildAnimatedContainer(context),
                  buildContainerTabBar(context),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: buildForm(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: context.dynamicHeight(0.3),
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "assets/login/hd.png",
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 5),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.w300,
          ),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w300, height: 2),
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.orange.shade400,
      indicatorWeight: 3,
      tabs: [
        Text("  Login  ", style: TextStyle(color: Colors.black)),
        Text(" SignUp ", style: TextStyle(color: Colors.black))
      ],
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: LoginViewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        Spacer(flex: 2),
        buildTextFormFieldEmail(),
        buildTextFormFieldPassword(context),
        Spacer(flex: 2),
        buildAlignTextForgot(),
        Spacer(flex: 6),
        buildElevatedButtonLogin(context),
        buildRowQuestion(context),
        Spacer()
      ]),
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      validator: (value) =>
          value!.isNotEmpty ? value.isValidEmail : "This field required",
      controller: LoginViewModel().emailController,
      decoration: InputDecoration(
        labelText: "Email",
        icon: buildContaierIconField(Icons.email),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }

  TextFormField buildTextFormFieldPassword(BuildContext context) {
    final loginProv = Provider.of<LoginViewModel>(context, listen: false);

    return TextFormField(
      validator: (value) => value!.isNotEmpty ? null : "This field required",
      controller: LoginViewModel().passwordController,
      obscureText: loginProv.isPassOpen,
      decoration: InputDecoration(
          labelText: "Password",
          icon: buildContaierIconField(Icons.lock),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          suffixIcon: IconButton(
              icon: context.watch<LoginViewModel>().isPassOpen
                  ? Icon(FontAwesomeIcons.eye)
                  : Icon(FontAwesomeIcons.eyeSlash),
              onPressed: () {
                loginProv.setPassOpen();
              })),
    );
  }

  Container buildContaierIconField(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.white),
      padding: EdgeInsets.all(10),
    );
  }

  Align buildAlignTextForgot() {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password?",
          textAlign: TextAlign.end,
        ));
  }

  ElevatedButton buildElevatedButtonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Center(
          child: Text("Login",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white))),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
    );
  }

  Row buildRowQuestion(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have a account?"),
        TextButton(
          onPressed: () {},
          child: Text(
            "SignUp",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}
