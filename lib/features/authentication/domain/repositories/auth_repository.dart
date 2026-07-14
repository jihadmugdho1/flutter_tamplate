import 'package:riddimafrica/core/models/response_data.dart';

abstract class AuthRepository {
  Future<ResponseData> login(String email, String password);
}
