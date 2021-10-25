import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'march_controller.dart';

class MarchPages extends StatelessWidget {
  MarchPages({Key? key}) : super(key: key);

  final controller = Get.find<MarchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.grey,
            ],
          ),
        ),
        child: GridView(
            padding: const EdgeInsets.all(25),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              Container(width: 100, height: 100, color: Colors.blue, child: Text('${controller.brands[1].name}'),),
              Container(width: 100, height: 100,color: Colors.red),
              
            ],
            ),
      ),
    );
  }
}




//  ListView.builder(
//            itemCount: state?.length,
//            itemBuilder: (_, index) {
//              return Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(15),
//                  gradient: const LinearGradient(
//                    colors: [
//                      Colors.blue,
//                      Colors.grey,
//                    ],
//                  ),
//                ),
//                child: GridView(
//                  padding: const EdgeInsets.all(25),
//                  scrollDirection: Axis.vertical,
//                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                    maxCrossAxisExtent: 200,
//                    childAspectRatio: 3 / 2,
//                    crossAxisSpacing: 20,
//                    mainAxisSpacing: 20,
//                  ),
//                  children: [
//                    Center(
//                      child: Text('${state![index].name}'),
//                    ),
//                  ],
//                ),
//              );
//            },
//          )




