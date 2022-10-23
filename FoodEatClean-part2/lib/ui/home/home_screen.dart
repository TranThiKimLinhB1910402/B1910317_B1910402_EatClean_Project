import 'package:eatcleanproject/ui/home/app_bar_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/app_bar.dart';
import 'package:eatcleanproject/ui/widgets/category_list.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/home/home_screen_body.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';

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
