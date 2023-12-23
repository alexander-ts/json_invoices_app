import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_invoices_app/models/invoice.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({
    super.key,
    required this.invoice,
  });

  static const routeName = '/invoice';
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(invoice.docNumber)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        child: ListView.separated(
          itemCount: invoice.items.length,
          itemBuilder: (context, i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            invoice.items[i].productName,
                            style: Theme.of(context).textTheme.bodyLarge,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Годен до ${DateFormat('dd.MM.yyyy').format(invoice.items[i].expirationDate)}',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      invoice.items[i].quantity.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, i) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
