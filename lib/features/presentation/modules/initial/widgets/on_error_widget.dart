import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/initial_page.dart';
import 'package:mobicar/features/presentation/routes/routes.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/oops-404.png'),
          const SizedBox(height: 10),
          const Text(
            'Falha na conexão!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Get.offAllNamed(Routes.INITIAL);
            },
            icon: Icon(Icons.wifi_off),
            label: Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
