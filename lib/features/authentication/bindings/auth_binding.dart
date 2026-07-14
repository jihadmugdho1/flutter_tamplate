import 'package:get/get.dart';
import 'package:riddimafrica/core/services/network/network_caller.dart';
import 'package:riddimafrica/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:riddimafrica/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:riddimafrica/features/authentication/domain/repositories/auth_repository.dart';
import 'package:riddimafrica/features/authentication/domain/usecases/login_usecase.dart';
import 'package:riddimafrica/features/authentication/presentation/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkCaller>(() => NetworkCaller());

    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(Get.find<NetworkCaller>()),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find<AuthRemoteDataSource>()),
    );

    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find<AuthRepository>()));

    Get.lazyPut<AuthController>(() => AuthController(Get.find<LoginUseCase>()));
  }
}
