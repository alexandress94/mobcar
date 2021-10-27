import 'package:flutter/material.dart';

class OnEmptyWidget extends StatelessWidget {
  const OnEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nada pra listar aqui...',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
