import 'package:get/get.dart';
import 'package:flutter_tamplate/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_tamplate/core/models/response_data.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  
  AuthController(this.loginUseCase);

  final isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final ResponseData response = await loginUseCase.execute(email, password);
      if (response.isSuccess) {
        // Handle success
      } else {
        // Handle error
      }
    } finally {
      isLoading.value = false;
    }
  }
}