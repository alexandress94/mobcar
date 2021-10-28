import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/splash/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/mobcar.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Carregando...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    });
  }
}
