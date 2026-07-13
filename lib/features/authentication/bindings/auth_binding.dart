import 'package:get/get.dart';
import 'package:flutter_tamplate/core/services/network/network_caller.dart';
import 'package:flutter_tamplate/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_tamplate/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:flutter_tamplate/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_tamplate/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkCaller>(() => NetworkCaller());
    
    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(Get.find<NetworkCaller>()));
        
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<AuthRemoteDataSource>()));
        
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find<AuthRepository>()));
    
    Get.lazyPut<AuthController>(() => AuthController(Get.find<LoginUseCase>()));
  }
}
