import 'package:eatcleanproject/ui/DetailsProduct/details_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:flutter/material.dart';
import '../screen.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen()));
                },
                child: Container(
                  height: 120,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/banner/banner2.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 250,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFe8e8e8),
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Salad rau củ cá hồi áp chảo ngon",
                                size: 15,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              SmallText(text: 'Gạo lứt, rau củ, cá hồi'),
                              SizedBox(
                                height: 2,
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
                                height: 3,
                              ),
                              Row(
                                children: [
                                  IconAndText(
                                      icon: Icons.access_time_rounded,
                                      size: 15,
                                      text: "27 days",
                                      iconColor: AppColors.iconColor2)
                                ],
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
