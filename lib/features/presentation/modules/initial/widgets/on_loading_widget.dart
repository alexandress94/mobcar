import 'package:flutter/material.dart';

class OnLoadingWidget extends StatelessWidget {
  const OnLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
