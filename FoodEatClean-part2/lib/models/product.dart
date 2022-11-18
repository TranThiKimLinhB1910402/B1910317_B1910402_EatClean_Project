import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final String type;
  Product(
      {this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'type': type,
      'isFavorite': isFavorite
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        type: json['type'],
        isFavorite: json['isFavorite']);
  }

  Product copyWith(
      {String? id,
      String? title,
      String? description,
      String? type,
      double? price,
      String? imageUrl,
      bool? isFavorite}) {
    return Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        type: type ?? this.type,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
