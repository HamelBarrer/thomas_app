import 'package:thomas_app/core/utils/formatters.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';

class SaleModel extends Sale {
  const SaleModel({
    super.id,
    required super.clientName,
    required super.productId,
    required super.productTitle,
    required super.productImage,
    required super.quantity,
    required super.unitPrice,
    required super.totalPrice,
    required super.saleDate,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) {
    return SaleModel(
      id: json['id'] as int?,
      clientName: json['client_name'] as String,
      productId: json['product_id'] as int,
      productTitle: json['product_title'] as String,
      productImage: json['product_image'] as String,
      quantity: json['quantity'] as int,
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      saleDate: Formatters.parseDateFromDb(json['sale_date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'client_name': clientName,
      'product_id': productId,
      'product_title': productTitle,
      'product_image': productImage,
      'quantity': quantity,
      'unit_price': unitPrice,
      'total_price': totalPrice,
      'sale_date': Formatters.formatDateForDb(saleDate),
    };
  }

  Sale toEntity() => this;

  SaleModel copyWith({
    int? id,
    String? clientName,
    int? productId,
    String? productTitle,
    String? productImage,
    int? quantity,
    double? unitPrice,
    double? totalPrice,
    DateTime? saleDate,
  }) {
    return SaleModel(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      productId: productId ?? this.productId,
      productTitle: productTitle ?? this.productTitle,
      productImage: productImage ?? this.productImage,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      saleDate: saleDate ?? this.saleDate,
    );
  }
}
