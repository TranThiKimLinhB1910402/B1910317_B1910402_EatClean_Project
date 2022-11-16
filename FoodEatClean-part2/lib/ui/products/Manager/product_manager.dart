import '../../../models/product.dart';
import 'package:flutter/foundation.dart';

class ProductManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Salad hoa quả',
        type: 'Salad',
        description:
            "Salad trái cây là món ăn tươi mát, giúp chúng ta khỏe đẹp mỗi ngày trong khi công thức làm lại vô cùng đơn giản. Ngoài ra, món ăn từ trái cây này còn rất được ưa chuộng để giảm cân, thanh lọc cơ thể, bổ bổ sức khỏe. Sau đây, TASTY Kitchen sẽ giới thiệu bạn",
        price: 40.000,
        imageUrl:
            'https://img.tastykitchen.vn/resize/764x-/2021/05/31/trai-cay-cung-cap-nguon-dinh-duong-doi-dao-tuoi-ma-861d.jpg',
        isFavorite: true),
    Product(
        id: 'p2',
        title: 'Cá hồi rán',
        type: 'Rán',
        description:
            "150g cá hồi ướp muối, lá húng tây khô áp chảo, 1 bông cải xanh 200gr xào với 1 chén con mỳ ý (mỳ luộc trước xào).",
        price: 40.000,
        imageUrl:
            'https://cdn2.tieudungplus.vn/media/uploaded/26/2018/06/08/thuc-don-an-kieng-eat-clean-tieudungplus-5-tieudungplus-1528455450.jpg',
        isFavorite: true),
    Product(
        id: 'p3',
        title: 'Cá hồi rán',
        type: 'Rán',
        description:
            "150g cá hồi ướp muối, lá húng tây khô áp chảo, 1 bông cải xanh 200gr xào với 1 chén con mỳ ý (mỳ luộc trước xào).",
        price: 40.000,
        imageUrl:
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dmVnZXRhcmlhbiUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80',
        isFavorite: true),
    Product(
        id: 'p4',
        title: 'Salad hoa quả',
        type: 'Salad',
        description:
            "Salad trái cây là món ăn tươi mát, giúp chúng ta khỏe đẹp mỗi ngày trong khi công thức làm lại vô cùng đơn giản. Ngoài ra, món ăn từ trái cây này còn rất được ưa chuộng để giảm cân, thanh lọc cơ thể, bổ bổ sức khỏe. Sau đây, TASTY Kitchen sẽ giới thiệu bạn",
        price: 40.000,
        imageUrl:
            'https://www.eatthis.com/wp-content/uploads/sites/4/2020/07/woman-eating-healthy.jpg?quality=82&strip=1',
        isFavorite: true),
    Product(
        id: 'p5',
        title: 'Cá hồi rán',
        type: 'Rán',
        description:
            "150g cá hồi ướp muối, lá húng tây khô áp chảo, 1 bông cải xanh 200gr xào với 1 chén con mỳ ý (mỳ luộc trước xào).",
        price: 40.000,
        imageUrl:
            'https://cdn.tgdd.vn/Files/2021/01/02/1317430/30-thuc-don-eat-clean-thuan-viet-de-giam-can-don-tet-cuc-xin-202101021407240704.jpg',
        isFavorite: true),
    Product(
        id: 'p6',
        title: 'Salad hoa quả',
        type: 'Rán',
        description:
            "Salad trái cây là món ăn tươi mát, giúp chúng ta khỏe đẹp mỗi ngày trong khi công thức làm lại vô cùng đơn giản. Ngoài ra, món ăn từ trái cây này còn rất được ưa chuộng để giảm cân, thanh lọc cơ thể, bổ bổ sức khỏe. Sau đây, TASTY Kitchen sẽ giới thiệu bạn",
        price: 40.000,
        imageUrl:
            'https://images.immediate.co.uk/production/volatile/sites/30/2014/05/Epic-summer-salad-hub-2646e6e.jpg',
        isFavorite: true),
    Product(
        id: 'p7',
        title: 'Cá hồi rán',
        type: 'Súp',
        description:
            "150g cá hồi ướp muối, lá húng tây khô áp chảo, 1 bông cải xanh 200gr xào với 1 chén con mỳ ý (mỳ luộc trước xào).",
        price: 40.000,
        imageUrl:
            'https://www.trifectanutrition.com/hubfs/clean-eating-food-list-eat-clean-acai-smoothie-bowl.jpg',
        isFavorite: true),
    Product(
        id: 'p8',
        title: 'Cá hồi rán',
        type: 'Hạt',
        description:
            "150g cá hồi ướp muối, lá húng tây khô áp chảo, 1 bông cải xanh 200gr xào với 1 chén con mỳ ý (mỳ luộc trước xào).",
        price: 40.000,
        imageUrl:
            'https://www.trifectanutrition.com/hubfs/clean-eating-food-list-eat-clean-acai-smoothie-bowl.jpg',
        isFavorite: true),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((favItems) => favItems.isFavorite).toList();
  }

  List<Product> getSaladItems(String type) {
    return _items.where((saladItem) => saladItem.type == type).toList();
  }

  Product findById(String productId) {
    return _items.firstWhere((prodItem) => (prodItem.id == productId));
  }
}
