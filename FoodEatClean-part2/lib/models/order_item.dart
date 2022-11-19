import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'cart_item.dart';

class OrderItem with ChangeNotifier {
  final String? id;
  final double amount;
  final List<CartItem>? products;
  final DateTime dateTime;
  final String full_name;
  final String phone;
  final String address;

  int get productCount {
    return products!.length;
  }

  OrderItem({
    this.id,
    required this.amount,
    required this.products,
    required this.full_name,
    required this.phone,
    required this.address,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now();
Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      //'products': products,
      'full_name': full_name,
      'address': address,
      'phone': phone
    };
  }
  static OrderItem fromJson(Map<String, dynamic> json) {
    return OrderItem(
        id: json['id'],
        amount: json['amount'],
       products: json['products'],
        full_name: json['full_name'],
        phone: json['phone'],
        address: json['address']);
  }

  OrderItem copyWith({
    String? id,
    double? amount,
    List<CartItem>? products,
    DateTime? dateTime,
    String? full_name,
    String? phone,
    String? address,
  }) {
    return OrderItem(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        products: products ?? this.products,
        phone: phone ?? this.phone,
        full_name: full_name ?? this.full_name,
        address: address ?? this.address,
        dateTime: dateTime ?? this.dateTime);
  }
}
