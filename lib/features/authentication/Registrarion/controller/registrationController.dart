import 'package:bankx/features/authentication/Registrarion/models/registrationInfo.dart';
import 'package:bankx/features/authentication/Registrarion/repository/registration_repo.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final RxBool isRegistered = false.obs;
  final registrationRepo = Get.put(RegistrationRepository());

  register(RegistrationInfo registrationInfo) async {
    try {
      final Response status =
          await registrationRepo.registerUser(registrationInfo);
      if (status.hasError) {
      } else {
        isRegistered(true);
      }
    } catch (e) {}
  }
}
