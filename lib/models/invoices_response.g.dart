// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicesResponse _$InvoicesResponseFromJson(Map<String, dynamic> json) =>
    InvoicesResponse(
      invoices: (json['invoices'] as List<dynamic>?)
              ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$InvoicesResponseToJson(InvoicesResponse instance) =>
    <String, dynamic>{
      'invoices': instance.invoices,
    };
