import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/presentation/routes/routes.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/oops-404.png'),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Get.offAllNamed(Routes.INITIAL);
                },
                icon: const Icon(Icons.wifi_off),
                label: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
