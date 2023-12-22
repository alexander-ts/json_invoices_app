import 'dart:convert';
import 'dart:io';

import 'package:json_invoices_app/models/invoice.dart';
import 'package:json_invoices_app/models/invoices_response.dart';
import 'package:json_invoices_app/repositories/invoices_repository.dart';

final class FileInvoicesRepository implements InvoicesRepository {
  FileInvoicesRepository({required this.path});

  final String path;

  File _getFileFromPath() => File(path);

  @override
  Future<List<Invoice>> getInvoices() async {
    final file = _getFileFromPath();
    final text = await file.readAsString();
    final json = jsonDecode(text);

    final response = InvoicesResponse.fromJson(json);
    return response.invoices;
  }
}
