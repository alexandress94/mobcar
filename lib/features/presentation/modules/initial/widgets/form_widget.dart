import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/data/models/march_model.dart';
import 'package:mobicar/features/data/models/models_model.dart';
import 'package:mobicar/features/data/models/year_model.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/favorite_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/march_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/model_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/price_controller.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/year_controller.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key}) : super(key: key);

  final _marchController = Get.find<MarchController>();
  final _modelsController = Get.find<ModelController>();
  final _yearController = Get.find<YearController>();
  final _priceController = Get.find<PriceController>();
  final _favoriteController = Get.find<FavoriteController>();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Row(
            children: const [
              Flexible(
                child: Text('Cadastre seu veículo favorito'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, thickness: 1),
        ],
      ),
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
                  _.setNameMarch = value!.name!;
                  _.setCodeMarch = value.code!;
                  _modelsController.getAll(value.code!);
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
                  _.setNameModel = value!.name!;
                  _.setCodeModel = value.code!;
              
                  _yearController.getAll(
                    _marchController.getCodeMarch.toString(),
                    value.code!,
                  );
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
                  _.setNameYear = value!.name!;
                  _priceController.getPrice(
                    _marchController.getCodeMarch,
                    _modelsController.getCodeModel,
                    value.code!,
                  );
                },
              );
            },
          ),
          Form(
            key: _keyForm,
            child: TextFormField(
              readOnly: true,
              controller: _priceController.priceTextController,
              decoration: const InputDecoration(
                hintText: 'Valor: (R\$)',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Este campo não pode ser vazio.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  _priceController.priceTextController.clear();
                  Get.back();
                },
                child: const Text('Voltar'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    _favoriteController.insert();
                    _priceController.priceTextController.clear();

                    Get.back();
                  }
                },
                label: const Text('Confirmar'),
              ),
            ],
          )
        ],
      ),
    );
  }

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
