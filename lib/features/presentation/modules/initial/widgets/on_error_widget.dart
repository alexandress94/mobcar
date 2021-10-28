import 'package:flutter/material.dart';

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
          const CircularProgressIndicator(
              // backgroundColor: Colors.blue,
              )
          // ElevatedButton.icon(
          //   onPressed: () {
          //     Get.offAllNamed(Routes.INITIAL);
          //   },
          //   icon: const Icon(Icons.wifi_off),
          //   label: const Text('Tentar novamente'),
          // ),
        ],
      ),
    );
  }
}
