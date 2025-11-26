import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/doctor_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DoctorController>(() => DoctorController(), fenix: true);
  }
}
