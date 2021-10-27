import 'package:flutter/material.dart';

import 'widgets/alert_dialog_widget.dart';

class InitialPages extends StatelessWidget {
  InitialPages({Key? key}) : super(key: key);

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialogWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
            // _priceController.priceTextController.clear();
          },
          child: Text('clique aqui'),
        ),
      ),
    );
  }
}
