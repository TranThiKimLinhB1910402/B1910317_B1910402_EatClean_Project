import '/ui/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';

import '/ui/colors.dart';
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
            color: Color.fromARGB(255, 96, 95, 95)
                .withOpacity(0.25), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(2, 2),
          )
        ],
        color: AppColors.yellowColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: new Icon(Icons.arrow_back, size: 25.0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            color: AppColors.mainColor,
          ),
          Text(
            'Giỏ hàng',
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500),
          ),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // color: Color.fromARGB(255, 239, 238, 238),
              ),
              child: IconButton(
                padding: new EdgeInsets.all(0.0),
                icon: FaIcon(
                  FontAwesomeIcons.comments,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromARGB(255, 170, 36, 10),
              )),
        ],
      ),
    );
  }
}
