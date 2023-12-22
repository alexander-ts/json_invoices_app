import 'package:json_invoices_app/repositories/file_invoice_repository.dart';
import 'package:test/test.dart';

void main() {
  test(
    'should retrieve invoices from file without errors',
    () async {
      final fileRepository = FileInvoicesRepository(path: 'documents.json');
      final invoices = await fileRepository.getInvoices();
      expect(invoices.length, 8);
    },
  );
}
