import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/models_controller.dart';
import 'controllers/march_controller.dart';
import 'widgets/success_widget.dart';

class InitialPages extends StatelessWidget {
  InitialPages({Key? key}) : super(key: key);

  final _marchController = Get.find<MarchController>();
  final _modelsController = Get.find<ModelsController>();

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Obx(
          () {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: _marchController.selected.toString(),
                    items: _comboBrands(),
                    onChanged: (String? value) {
                      _marchController.selected.value = value!;
                      if (_marchController.brands[0].name == value) {
                        _modelsController
                            .getAll(_marchController.brands[0].codigo!);
                      }
                    },
                  ),
                  DropdownButton<String>(
                    value: _modelsController.selected.toString(),
                    items: _comboModels(),
                    onChanged: (String? value) {
                      _modelsController.selected.value = value!;
                    },
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Voltar'),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
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
          },
          child: Text('clique aqui'),
        ),
      ),
    );
  }

  // Obx(
  //           () {
  //             return Center(
  //               child: DropdownButton<String>(
  //                 value: controller.selected.toString(),
  //                 items: _comboList(),
  //                 onChanged: (String? value) {
  //                   controller.selected.value = value!;
  //                   // if (_.brands[0].name == value) {
  //                   //   print("Sim");
  //                   // } else {
  //                   //   print("Não");
  //                   // }
  //                   // controller.itemSelected.value = value!;
  //                 },
  //               ),
  //             );
  //           },
  //         )

  // List<DropdownMenuItem<String>> _comboList() {
  //   List<DropdownMenuItem<String>> listItems = [];
  //   for (int index = 0; index < controller.brands.length; index++) {
  //     listItems.add(
  //       DropdownMenuItem<String>(
  //         child: Text('${controller.brands[index].name}'),
  //         value: controller.brands[index].name,
  //       ),
  //     );
  //   }
  //   return listItems.toList();
  // }

  List<DropdownMenuItem<String>> _comboBrands() {
    return _marchController.brands
        .map(
          (value) => DropdownMenuItem<String>(
            child: Text('${value.name}'),
            value: value.name,
          ),
        )
        .toList();
  }

  List<DropdownMenuItem<String>> _comboModels() {
    return _modelsController.models
        .map(
          (value) => DropdownMenuItem<String>(
            child: Text('${value.name}'),
            value: value.name,
          ),
        )
        .toList();
  }
}
