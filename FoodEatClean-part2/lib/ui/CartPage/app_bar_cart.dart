import 'package:eatcleanproject/ui/home/home_screen.dart';
import 'package:eatcleanproject/ui/widgets/appicon.dart';
import 'package:eatcleanproject/ui/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 30, top: 35, bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 10, // blur radius
            offset: Offset(0, 2),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //     height: 40,
          //     width: 40,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: Color.fromARGB(255, 239, 238, 238),
          //     ),
          //     child: IconButton(
          //       padding: new EdgeInsets.all(0.0),
          //       icon: new Icon(Icons.arrow_back, size: 18.0),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       color: Color(0xFF756d54),
          //     )),
          IconButton(
            icon: new Icon(Icons.arrow_back, size: 25.0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            color: AppColors.mainColor,
          ),
          BigText(
            text: 'Giỏ hàng',
            size: 20,
            color: AppColors.mainColor,
          ),
          // Text('Giỏ hàng',
          //     style: TextStyle(
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.w500,
          //         fontSize: 18)),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 239, 238, 238),
              ),
              child: IconButton(
                padding: new EdgeInsets.all(0.0),
                icon: FaIcon(
                  FontAwesomeIcons.comments,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xFF756d54),
              )),
        ],
      ),
    );
  }
}
