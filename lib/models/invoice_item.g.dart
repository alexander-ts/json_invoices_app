// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => InvoiceItem(
      id: json['id'] as String,
      productName: json['productName'] as String,
      retailPrice: (json['retailPrice'] as num).toDouble(),
      supplierPrice: (json['supplierPrice'] as num).toDouble(),
      serialNumber: json['serialNumber'] as String,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      quantity: json['quantity'] as int,
      kizQuantity: json['kizQuantity'] as int,
      kiz: json['kiz'] as bool,
      kizList: json['kizList'] as List<dynamic>? ?? [],
      baseGtin: json['baseGtin'],
    );

Map<String, dynamic> _$InvoiceItemToJson(InvoiceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'retailPrice': instance.retailPrice,
      'supplierPrice': instance.supplierPrice,
      'serialNumber': instance.serialNumber,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'quantity': instance.quantity,
      'kizQuantity': instance.kizQuantity,
      'kiz': instance.kiz,
      'kizList': instance.kizList,
      'baseGtin': instance.baseGtin,
    };
