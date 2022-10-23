class TypeProduct {
  final String? maloai;
  final String tenloai;
  final String hinhanh;

  TypeProduct({
    this.maloai,
    required this.hinhanh,
    required this.tenloai,
  });

  TypeProduct copyWith({
    String? maloai,
    String? tenloai,
    String? hinhanh
  }){
    return TypeProduct(
      maloai: maloai ?? this.maloai,
      hinhanh: hinhanh ?? this.hinhanh,
      tenloai: tenloai ?? this.tenloai);
  }
}
