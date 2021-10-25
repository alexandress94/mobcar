import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/march_model.dart';

import '../controllers/march_controller.dart';

class SuccessWidget extends StatelessWidget {
  final List<MarchModel> state;
  final MarchController controller;
  const SuccessWidget({Key? key, required this.state, required this.controller})
      : super(key: key);

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _comboList() {
    return state
        .map(
          (value) => DropdownMenuItem<String>(
            child: Text('${value.name}'),
            value: value.name,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.blue[100],
            ),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: const Icon(Icons.add),
              label: const Text('Adicionar'),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
