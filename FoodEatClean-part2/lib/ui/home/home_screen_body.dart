import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../models/product.dart';
 
import 'package:eatcleanproject/ui/screen.dart';
 
class HomeBodyPage extends StatefulWidget {
  static const routeName = '/homepage';
 
  const HomeBodyPage({super.key});
  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}
 
class _HomeBodyPageState extends State<HomeBodyPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
 
  late Future<void> _fetchProducts;
 
 
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
 
  @override
  void initState() {
    super.initState();
 
    _fetchProducts = context.read<ProductManager>().fetchProducts();
 
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }
 
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    final productsManager = ProductManager();
 
    final products = context.select<ProductManager, List<Product>>(
        (productsManager) => productsManager.items);
 
    return Column(
      children: [
        HomePageItem(),
        SizedBox(
          height: 10,
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.mainColor),
        ),
        //popular text
 
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: CategoryList(),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Món ăn yêu thích',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsPage()));
              },
              icon: Icon(
                Icons.chevron_right,
                color: AppColors.mainColor,
              ),
            )
          ]),
        ),
 
        Container(
          height: 880,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) => CartProduct(products[index])),
        )
      ],
    );
  }
}
 

