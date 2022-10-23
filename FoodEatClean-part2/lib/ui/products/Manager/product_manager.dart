import '../../../models/product.dart';
import 'package:flutter/foundation.dart';

class ProductManager {
  final List<Product>_items = [
    Product(
      id: 'p1',
      title: 'Salad hoa quả',
      type: 'Salad',
      description: "Salad trái cây là món ăn tươi mát, giúp chúng ta khỏe đẹp mỗi ngày trong khi công thức làm lại vô cùng đơn giản. Ngoài ra, món ăn từ trái cây này còn rất được ưa chuộng để giảm cân, thanh lọc cơ thể, bổ bổ sức khỏe. Sau đây, TASTY Kitchen sẽ giới thiệu bạn",
      price: 40.000,
      imageUrl: 'https://img.tastykitchen.vn/resize/764x-/2021/05/31/trai-cay-cung-cap-nguon-dinh-duong-doi-dao-tuoi-ma-861d.jpg',
      isFavorite: true
    ),
     Product(
      id: 'p2',
      title: 'Cá hồi rán',
      type: 'Rán',
      description: "150g cá hồi ướp muối, lá húng tây khô áp chảo, 1 bông cải xanh 200gr xào với 1 chén con mỳ ý (mỳ luộc trước xào).",
      price: 40.000,
      imageUrl: 'https://cdn2.tieudungplus.vn/media/uploaded/26/2018/06/08/thuc-don-an-kieng-eat-clean-tieudungplus-5-tieudungplus-1528455450.jpg',
      isFavorite: true
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items{
    return [..._items];
  }

  List <Product> get favoriteItems{
    return _items.where((favItems) => favItems.isFavorite).toList();
  }

  Product findById(String productId){
    return _items.firstWhere((prodItem) => (prodItem.id == productId));
  }

}