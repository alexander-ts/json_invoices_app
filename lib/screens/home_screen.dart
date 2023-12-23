import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_invoices_app/repositories/invoices_repository.dart';
import 'package:json_invoices_app/screens/invoice_screen.dart';
import 'package:json_invoices_app/screens/widgets/error_message.dart';
import 'package:json_invoices_app/screens/widgets/invoice_list_tile.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.invoicesRepository});

  final InvoicesRepository invoicesRepository;

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Invoices',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: FutureBuilder(
        future: widget.invoicesRepository.getInvoices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? [];
            return ListView.separated(
              itemBuilder: (context, i) => InvoiceListTile(
                invoice: data[i],
                onTap: () => Navigator.of(context).pushNamed(
                  InvoiceScreen.routeName,
                  arguments: data[i],
                ),
              ),
              separatorBuilder: (context, i) => const Divider(height: 1, thickness: 1),
              itemCount: data.length,
            );
          }

          if (snapshot.hasError) {
            String message = 'Произошла неизвестная ошибка!';
            String buttonTitle = '';
            VoidCallback? callback;

            if (snapshot.error.runtimeType == PathAccessException) {
              message = 'У приложения недостаточно прав на чтение файла';
              buttonTitle = 'Открыть настройки';
              callback = () => openAppSettings();
            }

            if (snapshot.error.runtimeType == PathNotFoundException) {
              message = 'Файл не найден';
            }

            return ErrorMessage(
              message: message,
              buttonTitle: buttonTitle,
              onButtonPressed: callback,
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
