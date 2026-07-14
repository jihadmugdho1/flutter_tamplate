import 'package:get/get.dart';
import 'package:riddimafrica/core/services/network/internet_service.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<InternetService>(InternetService(), permanent: true);
  }
}
