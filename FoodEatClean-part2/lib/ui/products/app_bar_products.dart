import '/ui/CartPage/cart_screen.dart';
import '/ui/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import '/ui/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarProducts extends StatelessWidget {
  const AppBarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45, bottom: 20),
      padding: EdgeInsets.only(left: 20, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 239, 238, 238),
              ),
              child: IconButton(
                padding: new EdgeInsets.all(0.0),
                icon: new Icon(Icons.arrow_back, size: 18.0),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xFF756d54),
              )),
          Container(
            height: 50,
            width: 250,
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
                  width: 175,
                  margin: EdgeInsets.only(left: 15),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                IconButton(
                  padding: new EdgeInsets.only(left: 20),
                  icon: new Icon(Icons.search, size: 25.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
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
