// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      id: json['id'] as String,
      docNumber: json['docNumber'] as String,
      docDate: dateTimeParser(json['docDate'] as String),
      supplierNumber: json['supplierNumber'] as String,
      supplierDate: DateTime.parse(json['supplierDate'] as String),
      supplierName: json['supplierName'] as String,
      supplierSum: (json['supplierSum'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'docNumber': instance.docNumber,
      'docDate': instance.docDate.toIso8601String(),
      'supplierNumber': instance.supplierNumber,
      'supplierDate': instance.supplierDate.toIso8601String(),
      'supplierName': instance.supplierName,
      'supplierSum': instance.supplierSum,
      'items': instance.items,
    };
