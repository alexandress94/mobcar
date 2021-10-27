import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/favorite_model.dart';

class SuccessWidget extends StatelessWidget {

  final List<FavoriteModel> state;

  const SuccessWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: state.length,
        itemBuilder: (BuildContext _, int index) {
          FavoriteModel  favoirte = state[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${favoirte.march}'.substring(0, 1).toUpperCase(),),
              ),
              title: Text('${favoirte.march}'),
              subtitle: Text('${favoirte.price}'),
              trailing: const Text(
                'MENU POPUP',
              ),
              onTap: (){

              },
            ),
          );
        },
      ),
    );
  }
}
