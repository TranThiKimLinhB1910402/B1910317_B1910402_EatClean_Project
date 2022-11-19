import '/ui/CartPage/cart_screen.dart';

import 'package:flutter/material.dart';
import '/ui/widgets/big_text.dart';
import '/ui/widgets/small_text.dart';
import '/ui/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45, bottom: 20),
      padding: EdgeInsets.only(left: 20, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(
                text: 'Eat Clean',
                color: AppColors.mainColor,
                size: 15,
              ),
              SmallText(text: "Cần Thơ")
            ],
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                IconButton(
                  padding: new EdgeInsets.all(0.0),
                  icon: new Icon(Icons.search, size: 25.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: AppColors.mainColor,
                )
              ],
            ),
          ),
          IconButton(
              constraints: BoxConstraints(maxWidth: 20),
              onPressed: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              color: AppColors.mainColor,
              icon: FaIcon(FontAwesomeIcons.cartShopping, size: 18)),
        ],
      ),
    );
  }
}
