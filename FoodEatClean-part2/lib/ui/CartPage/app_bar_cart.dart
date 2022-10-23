import 'package:eatcleanproject/ui/widgets/appicon.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';
import 'package:eatcleanproject/ui/colors.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      padding: EdgeInsets.only(left: 20, right: 30, top: 35, bottom: 10),
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
          BigText(text: 'Giỏ hàng')
        ],
      ),
    );
  }
}
