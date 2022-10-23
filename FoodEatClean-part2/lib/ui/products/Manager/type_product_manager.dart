import 'package:eatcleanproject/models/typeproduct.dart';

import '../../../models/typeproduct.dart';
import 'package:flutter/foundation.dart';

class TypeProductManager {
  final List<TypeProduct> _typeitems = [
    TypeProduct(
        maloai: "Salad",
        tenloai: "Salad",
        hinhanh:
            "https://img.lovepik.com/free_png/32/39/09/12K58PICndb7c871agYcc_PIC2018.png_860.png"),
    TypeProduct(
        maloai: "Rán",
        tenloai: "Rán",
        hinhanh:
            "https://png.pngtree.com/png-clipart/20190920/original/pngtree-a-plate-of-delicious-fried-fish-illustration-png-image_4624774.jpg"),
  ];

  int get itemCount {
    return _typeitems.length;
  }

  List<TypeProduct> get items {
    return [..._typeitems];
  }

}
