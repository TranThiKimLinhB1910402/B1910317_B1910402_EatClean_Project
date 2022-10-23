import 'package:flutter/material.dart';

import './ui//widgets/welcome_screen.dart';
import 'ui/RegisterForm/form_register_screen.dart';
import 'ui/RegisterForm/form_signin_screen.dart';
import 'package:eatcleanproject/ui/home/home_screen.dart';
import '../ui/DetailsProduct/details_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eat Clean Hong',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                Theme.of(context).textTheme.apply(displayColor: Colors.black)),
        routes: {
          RegisterPage.routeName: (ctx) => const RegisterPage(),
          SignInPage.routeName: (ctx) => const SignInPage(),
          RegisterPage.routeName: (ctx) => const RegisterPage(),
        },
        home: WelcomeScreen());
  }
}
