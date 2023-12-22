import 'package:json_annotation/json_annotation.dart';
import 'package:json_invoices_app/models/invoice.dart';

part 'invoices_response.g.dart';

@JsonSerializable()
class InvoicesResponse {
  const InvoicesResponse({
    required this.invoices,
  });

  @JsonKey(defaultValue: [])
  final List<Invoice> invoices;

  factory InvoicesResponse.fromJson(Map<String, dynamic> data) => _$InvoicesResponseFromJson(data);
  Map<String, dynamic> toJson() => _$InvoicesResponseToJson(this);
}
