import 'package:flutter/material.dart';

class OnEmptyWidget extends StatelessWidget {
  OnEmptyWidget({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/fast-car-bro.png', width: 300, height: 300),
              const SizedBox(height: 10),
              const Text(
                'Nenhum cadastro realizado...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
