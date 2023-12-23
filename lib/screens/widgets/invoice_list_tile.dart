import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_invoices_app/models/invoice.dart';

class InvoiceListTile extends StatelessWidget {
  const InvoiceListTile({
    super.key,
    required this.invoice,
    required this.onTap,
  });

  final Invoice invoice;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(24),
      tileColor: Theme.of(context).cardColor,
      leading: const Icon(
        Icons.inventory_sharp,
        size: 40,
      ),
      title: Text(invoice.supplierName),
      subtitle: Text('${invoice.docNumber} от ${DateFormat('dd.MM.yyyy').format(invoice.docDate)}'),
      trailing: Text(
        invoice.items.length.toString(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      onTap: onTap,
    );
  }
}
