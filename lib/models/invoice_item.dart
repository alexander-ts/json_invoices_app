import 'package:json_annotation/json_annotation.dart';
part 'invoice_item.g.dart';

@JsonSerializable()
class InvoiceItem {
  const InvoiceItem({
    required this.id,
    required this.productName,
    required this.retailPrice,
    required this.supplierPrice,
    required this.serialNumber,
    required this.expirationDate,
    required this.quantity,
    required this.kizQuantity,
    required this.kiz,
    required this.kizList,
    required this.baseGtin,
  });

  final String id;
  final String productName;
  final double retailPrice;
  final double supplierPrice;
  final String serialNumber;
  final DateTime expirationDate;
  final int quantity;
  final int kizQuantity;
  final bool kiz;
  @JsonKey(defaultValue: [])
  final List<dynamic> kizList;
  final dynamic baseGtin;

  factory InvoiceItem.fromJson(Map<String, dynamic> data) => _$InvoiceItemFromJson(data);

  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
