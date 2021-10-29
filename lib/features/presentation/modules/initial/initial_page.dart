import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/connection_network_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/favorite_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/widgets/success_widget.dart';
import 'widgets/form_widget.dart';
import 'widgets/on_empty_widget.dart';
import 'widgets/on_error_widget.dart';
import 'widgets/on_loading_widget.dart';

class InitialPages extends GetView<FavoriteController> {
  InitialPages({Key? key}) : super(key: key);
  final _networkController = Get.find<ConnectionNetWorkController>();

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return FormWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(

        title: const Text('MOBCAR'),
        actions: [
          TextButton.icon(
            onPressed: () {
              showAlertDialog(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            label: const Text(
              'Novo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: GetBuilder<ConnectionNetWorkController>(
          builder: (_) => _networkController.connectionType == 0
              ? const OnErrorWidget()
              : controller.obx(
                  (state) => SuccessWidget(
                    state: state!,
                  ),
                  onEmpty: const OnEmptyWidget(),
                  onError: (_) => const OnErrorWidget(),
                  onLoading: const OnLoadingWidget(),
                ),
        ),
      ),
    );
  }
}
