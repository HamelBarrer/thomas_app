class Sale {
  final int? id;
  final String clientName;
  final int productId;
  final String productTitle;
  final String productImage;
  final int quantity;
  final double unitPrice;
  final double totalPrice;
  final DateTime saleDate;

  const Sale({
    this.id,
    required this.clientName,
    required this.productId,
    required this.productTitle,
    required this.productImage,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.saleDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sale &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          clientName == other.clientName &&
          productId == other.productId &&
          productTitle == other.productTitle &&
          productImage == other.productImage &&
          quantity == other.quantity &&
          unitPrice == other.unitPrice &&
          totalPrice == other.totalPrice &&
          saleDate == other.saleDate;

  @override
  int get hashCode =>
      id.hashCode ^
      clientName.hashCode ^
      productId.hashCode ^
      productTitle.hashCode ^
      productImage.hashCode ^
      quantity.hashCode ^
      unitPrice.hashCode ^
      totalPrice.hashCode ^
      saleDate.hashCode;

  @override
  String toString() {
    return 'Sale(id: $id, client: $clientName, quantity: $quantity, total: $totalPrice)';
  }
}
