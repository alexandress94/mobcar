import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/favorite_controller.dart';
import 'package:mobicar/futures/presentation/modules/initial/widgets/success_widget.dart';
import 'widgets/alert_dialog_widget.dart';
import 'widgets/on_empty_widget.dart';

class InitialPages extends GetView<FavoriteController> {
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
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: const Text('clique aqui'),
          ),
        ],
      ),
      body: controller.obx(
        (state) => SuccessWidget(
          state: state!,
        ),
        onEmpty: const OnEmptyWidget(),
      ),
    );
  }
}
