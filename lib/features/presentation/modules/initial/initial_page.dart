import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/favorite_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/widgets/success_widget.dart';
import 'widgets/alert_dialog_widget.dart';
import 'widgets/on_empty_widget.dart';
import 'widgets/on_error_widget.dart';
import 'widgets/on_loading_widget.dart';

class InitialPages extends GetView<FavoriteController> {
  const InitialPages({Key? key}) : super(key: key);

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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('MOBCAR'),
        actions: [
          TextButton.icon(
            onPressed: () {
              showAlertDialog(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              'Novo',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: controller.obx(
        (state) => SuccessWidget(
          state: state!,
        ),
        onEmpty: OnEmptyWidget(),
        onError: (_)=> const OnErrorWidget(),
        onLoading: OnLoadingWidget(),
      ),
    );
  }
}
