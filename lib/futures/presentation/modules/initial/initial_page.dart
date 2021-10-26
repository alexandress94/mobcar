import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/march_model.dart';
import 'package:mobicar/futures/data/models/models_model.dart';
import 'package:mobicar/futures/data/models/year_model.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/model_controller.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/price_controller.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/year_controller.dart';
import 'controllers/march_controller.dart';

class InitialPages extends StatelessWidget {
  InitialPages({Key? key}) : super(key: key);

  final _marchController = Get.find<MarchController>();
  final _modelsController = Get.find<ModelController>();
  final _yearController = Get.find<YearController>();
  final _textController = Get.find<PriceController>();

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<MarchController>(
                id: 'march',
                builder: (_) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    hint: const Text('Selecione uma marca'),
                    items: _comboBrands(),
                    onChanged: (MarchModel? value) {
                      _.setMarch = value!.name!;
                      _modelsController.getAll(value.code!);
                      _yearController.selectedCode.value = value.code!;
                    },
                  );
                },
              ),
              GetBuilder<ModelController>(
                id: 'model',
                builder: (_) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    hint: const Text('Selecione um modelo'),
                    items: _comboModels(),
                    onChanged: (ModelModel? value) {
                      _.setModel = value!.name!;
                      _yearController.getAll(
                          _yearController.selectedCode.toString(), value.code!);
                    },
                  );
                },
              ),
              GetBuilder<YearController>(
                id: 'year',
                builder: (_) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    hint: const Text('Selecione o ano'),
                    items: _comboYears(),
                    onChanged: (YearModel? value) {
                      _.setYear = value!.name!;
                    },
                  );
                },
              ),
              // TextFormField(
              //   controller: _textController.priceTextController,
              //   expands: true,
              //   decoration: const InputDecoration(
              //     hintText: 'Valor: (R\$)',
              //   ),
              //   textInputAction: TextInputAction.next,
              //   readOnly: true,
              // ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
            _marchController.getAll();
          },
          child: Text('clique aqui'),
        ),
      ),
    );
  }

// DropdownButton<String>(

//                     value: _marchController.selected.toString(),
//                     items: _comboBrands(),
//                     onChanged: (String? value) {
//                       _marchController.selected.value = value!;
//                     },
//                   ),
//                   DropdownButton<String>(
//                     value: _modelsController.brandSelected.toString(),
//                     items: _comboModels(),
//                     onChanged: (String? value) {
//                       _modelsController.brandSelected.value = value!;
//                       if
//                     },
//                   )

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

  List<DropdownMenuItem<MarchModel>> _comboBrands() {
    return _marchController.brands
        .map(
          (MarchModel value) => DropdownMenuItem<MarchModel>(
            child: Text('${value.name}'),
            value: value,
          ),
        )
        .toList();
  }

  List<DropdownMenuItem<ModelModel>> _comboModels() {
    return _modelsController.models
        .map(
          (ModelModel value) => DropdownMenuItem<ModelModel>(
            child: Text('${value.name}'),
            value: value,
          ),
        )
        .toList();
  }

  List<DropdownMenuItem<YearModel>> _comboYears() {
    return _yearController.years
        .map(
          (YearModel value) => DropdownMenuItem<YearModel>(
            child: Text('${value.name}'),
            value: value,
          ),
        )
        .toList();
  }
}
