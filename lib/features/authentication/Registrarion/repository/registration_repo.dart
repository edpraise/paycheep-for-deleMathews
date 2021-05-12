import 'package:bankx/features/authentication/Registrarion/models/registrationInfo.dart';
import 'package:get/get.dart';

class RegistrationRepository extends GetConnect {
  Future<Response> registerUser(RegistrationInfo registrationInfo) async {
        try {
           return await post('http://paycheep.com.ng/api/v1/register', registrationInfo.toMap());
        } catch (e) {
          throw Exception(e);
        }
  }
}
