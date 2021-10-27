import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemBuilder: (BuildContext _, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('PRIMEIRA LETRA DO TITULO'.substring(0, 1).toUpperCase(),),
              ),
              title: const Text('TITULO'),
              subtitle: const Text('VALOR'),
              trailing: const Text(
                'MENU POPUP',
              ),
              onTap: (){
                print('REALIZAR ALGO');
              },
            ),
          );
        },
      ),
    );
  }
}
