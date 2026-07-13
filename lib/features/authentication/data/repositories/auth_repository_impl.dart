import 'package:flutter_tamplate/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_tamplate/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_tamplate/core/models/response_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<ResponseData> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }
}
