import '/models/typeproduct.dart';
import 'package:flutter/foundation.dart';

class TypeProductManager with ChangeNotifier {
  final List<TypeProduct> _typeitems = [
    TypeProduct(
        maloai: "type1",
        tenloai: "Salad",
        hinhanh:
            "https://www.tasteofhome.com/wp-content/uploads/2020/03/caesar-salad-GettyImages-1138387792.jpg?fit=700,700"),
    TypeProduct(
        maloai: "type2",
        tenloai: "Rán",
        hinhanh:
            "https://cdn.tgdd.vn/Files/2021/01/02/1317430/30-thuc-don-eat-clean-thuan-viet-de-giam-can-don-tet-cuc-xin-202101021345245574.png"),
    TypeProduct(
        maloai: "type3",
        tenloai: "Hạt",
        hinhanh:
            "https://www.tasteofhome.com/wp-content/uploads/2020/03/caesar-salad-GettyImages-1138387792.jpg?fit=700,700"),
    TypeProduct(
        maloai: "type4",
        tenloai: "Súp",
        hinhanh:
            "https://cdn.tgdd.vn/Files/2021/01/02/1317430/30-thuc-don-eat-clean-thuan-viet-de-giam-can-don-tet-cuc-xin-202101021345245574.png"),
  ];

  int get itemCount {
    return _typeitems.length;
  }

  List<TypeProduct> get items {
    return [..._typeitems];
  }
}
