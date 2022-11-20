import 'package:eatcleanproject/ui/auth/auth_info.dart';
import 'package:eatcleanproject/ui/screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_bar/bottom_bar.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
  const WelcomeScreen({Key? key}) : super(key: key);
}

class _WelcomeScreen extends State<WelcomeScreen> {
  int _currentPage = 0;
  final _pageController = PageController();
  List pages = [];

  @override
  void onTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [HomePage(), ProductsPage(), CartScreen(), AuthInfo()],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Trang chủ'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: FaIcon(
              FontAwesomeIcons.store,
              size: 15,
            ),
            title: Text('Cửa hàng'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cartShopping,
              size: 15,
            ),
            title: Text('Giỏ hàng'),
            activeColor: Color.fromARGB(255, 137, 73, 242),
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Tài khoản'),
            activeColor: Colors.greenAccent.shade700,
          )
        ],
      ),
    );
  }
}
