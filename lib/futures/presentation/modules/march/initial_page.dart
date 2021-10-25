import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'initial_controller.dart';
import 'widgets/success_widget.dart';

class InitialPages extends GetView<InitialController> {
  InitialPages({Key? key}) : super(key: key);

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
                    value: controller.selected.toString(),
                    items: _comboList(),
                    onChanged: (String? value) {
                      controller.selected.value = value!;
                      // if (_.brands[0].name == value) {
                      //   print("Sim");
                      // } else {
                      //   print("Não");
                      // }
                      // controller.itemSelected.value = value!;
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
      body: controller.obx(
        (state) => Center(
          child: ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text('clique aqui'),
          ),
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

  List<DropdownMenuItem<String>> _comboList() {
    return controller.brands
        .map(
          (value) => DropdownMenuItem<String>(
            child: Text('${value.name}'),
            value: value.name,
          ),
        )
        .toList();
  }
}
