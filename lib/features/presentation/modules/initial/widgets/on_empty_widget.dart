import 'package:flutter/material.dart';

class OnEmptyWidget extends StatelessWidget {
  const OnEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/fast-car-bro.png'),
          const FittedBox(
            child: Text(
              'Nenhum cadastro realizado...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
