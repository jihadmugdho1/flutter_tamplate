import 'package:riddimafrica/core/services/network/network_caller.dart';
import 'package:riddimafrica/core/models/response_data.dart';

class AuthRemoteDataSource {
  final NetworkCaller _api;

  AuthRemoteDataSource(this._api);

  Future<ResponseData> login(String email, String password) async {
    return await _api.postRequest(
      '/auth/login',
      body: {'email': email, 'password': password},
    );
  }
}
