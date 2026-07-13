import 'package:flutter_tamplate/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_tamplate/core/models/response_data.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<ResponseData> execute(String email, String password) {
    return repository.login(email, password);
  }
}
