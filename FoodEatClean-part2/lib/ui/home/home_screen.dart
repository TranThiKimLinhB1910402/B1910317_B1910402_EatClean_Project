import '/ui/home/app_bar_home.dart';

import 'package:flutter/material.dart';

import '/ui/home/home_screen_body.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[200],
        body: Column(
      children: [
        AppBarHome(),
        Expanded(
          child: SingleChildScrollView(
            child: HomeBodyPage(),
          ),
        ),
      ],
    ));
  }
}
