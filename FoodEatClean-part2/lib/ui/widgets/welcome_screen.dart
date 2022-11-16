import 'package:eatcleanproject/ui/CartPage/cart_screen.dart';
import 'package:eatcleanproject/ui/products/products_screen.dart';
import 'package:eatcleanproject/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:eatcleanproject/ui/colors.dart';

import 'package:eatcleanproject/ui/home/home_screen.dart';
import 'package:eatcleanproject/ui/home/home_page_item.dart';

import 'package:eatcleanproject/ui/home/home_screen_body.dart';
import 'package:eatcleanproject/ui/RegisterForm/form_register_screen.dart';
import 'package:eatcleanproject/ui/RegisterForm/form_signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
  const WelcomeScreen({Key? key}) : super(key: key);
}

class _WelcomeScreen extends State<WelcomeScreen> {
  int _selectedIndex = 0;
  List pages = [
    HomePage(),
    ProductsPage(),
    AuthScreen(),
  ];

  @override
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: Colors.amber[200]),
        selectedIconTheme: IconThemeData(color: AppColors.mainColor),
        fixedColor: Colors.green[600],
        currentIndex: _selectedIndex,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, size: 20),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.comment, size: 20),
            label: 'Chat',
          ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.cartShopping, size: 20),
          //   label: 'Giỏ hàng',
          // ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, size: 20),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
