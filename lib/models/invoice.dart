import 'package:json_annotation/json_annotation.dart';
import 'package:json_invoices_app/models/invoice_item.dart';

part 'invoice.g.dart';

DateTime dateTimeParser(String value) => DateTime.parse(value);

@JsonSerializable()
class Invoice {
  const Invoice({
    required this.id,
    required this.docNumber,
    required this.docDate,
    required this.supplierNumber,
    required this.supplierDate,
    required this.supplierName,
    required this.supplierSum,
    required this.items,
  });

  final String id;
  final String docNumber;
  @JsonKey(fromJson: dateTimeParser)
  final DateTime docDate;
  final String supplierNumber;
  final DateTime supplierDate;
  final String supplierName;
  final double supplierSum;
  final List<InvoiceItem> items;

  factory Invoice.fromJson(Map<String, dynamic> data) => _$InvoiceFromJson(data);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
