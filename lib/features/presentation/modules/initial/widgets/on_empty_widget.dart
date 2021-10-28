import 'package:flutter/material.dart';

class OnEmptyWidget extends StatelessWidget {
  const OnEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/fast-car-bro.png'),
          const SizedBox(height: 10),
          const Text(
            'Nenhum cadastro realizado...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
