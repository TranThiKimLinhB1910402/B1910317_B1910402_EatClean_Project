import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';
import 'package:eatcleanproject/ui/colors.dart';

class AppBarGlobal extends StatelessWidget {
  const AppBarGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45, bottom: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(text: 'Eat Clean', color: AppColors.mainColor),
              Row(
                children: [
                  SmallText(
                    text: "Can Tho",
                    color: Colors.black54,
                  ),
                  Icon(Icons.arrow_drop_down_rounded)
                ],
              )
            ],
          ),
          Center(
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainColor),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
