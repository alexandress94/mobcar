import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/connection_network_controller.dart';

class ConnectionNetworkBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConnectionNetWorkController>(() => ConnectionNetWorkController());
  }

}