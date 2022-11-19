import 'package:eatcleanproject/models/product.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/icon_and_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';

import 'package:eatcleanproject/ui/colors.dart';

class SlideHomeCart extends StatelessWidget {
  final Product product;
  const SlideHomeCart(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            print('list-type');
          },
          child: Container(
            height: 200,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(product.imageUrl))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 90,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: product.title,
                        size: 15,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 12,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "127"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "Comments")
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          IconAndText(
                              icon: Icons.access_time_rounded,
                              size: 18,
                              text: "27 days",
                              iconColor: AppColors.iconColor2)
                        ],
                      )
                    ]),
              )),
        )
      ],
    );
  }
}
