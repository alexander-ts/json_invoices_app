import 'dart:convert';

import 'package:json_invoices_app/models/invoice.dart';
import 'package:json_invoices_app/models/invoice_item.dart';
import 'package:test/test.dart';

const invoiceString = """{ 
  "id": "0bc70e60-8506-46a4-b751-cbbfc01c4c42",
  "docNumber": "000/ПН-01527506n",
  "docDate": "2023-06-01T10:06:01.943",
  "supplierNumber": "VG-8487669",
  "supplierDate": "2023-06-01T00:00:00",
  "supplierName": "Магнит Фарма Воронеж",
  "supplierSum": 6651.6700,
  "items": [
     {
           "id": "1a7aae39-c707-470c-9ff7-6fc79a8f397e",
           "productName": "Аскорутин таб. №50",
           "retailPrice": 64.0000,
           "supplierPrice": 43.2300,
           "serialNumber": "390522",
           "expirationDate": "2025-06-01T00:00:00",
           "quantity": 5,
           "kizQuantity": 0,
           "kiz": true,
           "kizList": null,
           "baseGtin": null
     }
  ]
}""";

const invoiceItemString = """
{
  "id": "817855e3-e698-4d77-b2cb-8617afacff17",
  "productName": "Гептрал лиоф в/в и в/м 400мг 760мг №5",
  "retailPrice": 1811.0000,
  "supplierPrice": 1697.5200,
  "serialNumber": "43366TB22",
  "expirationDate": "2025-06-30T00:00:00",
  "quantity": 1,
  "kizQuantity": 0,
  "kiz": true,
  "kizList": null,
  "baseGtin": null
}
""";

void main() {
  test(
    'InvoiceItem should be parsed from JSON string without errors',
    () {
      final json = jsonDecode(invoiceItemString);
      final invoice = InvoiceItem.fromJson(json);
      expect(invoice.id, '817855e3-e698-4d77-b2cb-8617afacff17');
    },
  );

  test(
    'Invoice should be parsed from JSON string without errors',
    () {
      final json = jsonDecode(invoiceString);
      final invoice = Invoice.fromJson(json);
      expect(invoice.id, '0bc70e60-8506-46a4-b751-cbbfc01c4c42');
      expect(invoice.supplierSum, 6651.67);
      expect(invoice.items.length, 1);
    },
  );
}
