import 'package:eatcleanproject/ui/colors.dart';
import 'package:flutter/material.dart';
import '/ui/home/CardFood/slide_home_cart.dart';
import '/ui/products/Manager/product_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';

// Thanh banner ở homepage

class HomePageItem extends StatefulWidget {
  const HomePageItem({super.key});

  @override
  State<HomePageItem> createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
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
        Container(
          height: 250,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              if (position > 5) {
                position = 0;
                return _buildPageItem(products, position);
              }
              return _buildPageItem(products, position);
            },
          ),
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
      ],
    );
  }

  Widget _buildPageItem(products, int index) {
    Matrix4 matrix = new Matrix4.identity();

    //Scale Page index current
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    //Scale Page index next
    else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    //Scale Page index previous
    else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child:
          products.length != 0 ? SlideHomeCart(products[index]) : Container(),
    );
  }
}
