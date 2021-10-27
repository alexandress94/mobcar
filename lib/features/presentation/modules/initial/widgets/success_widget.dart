import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/data/models/favorite_model.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/favorite_controller.dart';

class SuccessWidget extends StatelessWidget {
  final List<FavoriteModel> state;
  final _favoriteController = Get.find<FavoriteController>();
  final _keyForm = GlobalKey<FormState>();
  SuccessWidget({required this.state, Key? key}) : super(key: key);

  void showMessageAlertDialog(
      {required BuildContext context, required int id}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Permissão para excluir'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Deseja realmente excluir este registro?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      _favoriteController.delete(id);
                      Get.back();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showAlertDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.car_repair, size: 50),
                  const SizedBox(width: 10),
                  const Text('Atualizar veículo'),
                ],
              ),
              const Divider(height: 1, thickness: 1),
            ],
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  TextFormField(
                    controller: _favoriteController.marchTextController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Marca',
                      icon: Icon(Icons.create),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _favoriteController.modelTextController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Modelo',
                      icon: Icon(Icons.create),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _favoriteController.priceTextController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      icon: Icon(Icons.attach_money),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Sair'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            _favoriteController.updateFavorite();
                            Get.back();
                          }
                        },
                        icon: Icon(Icons.save),
                        label: const Text('Salvar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: state.length,
        itemBuilder: (BuildContext _, int index) {
          FavoriteModel favorite = state[index];
          return Card(
            key: ValueKey(favorite.id),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  '${favorite.march}'.substring(0, 1).toUpperCase(),
                ),
              ),
              title: Text('${favorite.march}'),
              subtitle: Text('${favorite.price}'),
              trailing: IconButton(
                onPressed: () {
                  showMessageAlertDialog(context: context, id: favorite.id!);
                  // _favoriteController.delete(favorite.id!);
                },
                icon: Icon(Icons.delete),
              ),
              onTap: () {
                _favoriteController.selectedId = favorite.id!;
                _favoriteController.marchTextController.text = favorite.march!;
                _favoriteController.modelTextController.text = favorite.model!;
                _favoriteController.priceTextController.text = favorite.price!;

                showAlertDialog(context: context);
              },
            ),
          );
        },
      ),
    );
  }
}
