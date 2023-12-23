import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_invoices_app/models/invoice.dart';
import 'package:json_invoices_app/repositories/file_invoice_repository.dart';
import 'package:json_invoices_app/screens/home_screen.dart';
import 'package:json_invoices_app/screens/invoice_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String defaultPath = 'storage/self/primary/Download/documents.json';

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    try {
      if (settings.name == InvoiceScreen.routeName) {
        final invoice = settings.arguments as Invoice;
        return MaterialPageRoute(builder: (_) => InvoiceScreen(invoice: invoice));
      }
      throw (Exception('Unknown root name.'));
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final invoicesRepository = FileInvoicesRepository(path: dotenv.env['PATH'] ?? defaultPath);
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(invoicesRepository: invoicesRepository),
      },
      onGenerateRoute: onGenerateRoute,
    );
  }
}
