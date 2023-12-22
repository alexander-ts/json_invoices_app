import 'package:json_invoices_app/models/invoice.dart';

abstract interface class InvoicesRepository {
  Future<List<Invoice>> getInvoices();
}
