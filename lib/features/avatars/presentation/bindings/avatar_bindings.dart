import 'package:get/get.dart';
import '../../data/datasources/avatar_datasource.dart';
import '../../data/repositories/avatar_repository_impl.dart';
import '../../domain/repositories/avatar_repository.dart';
import '../../domain/usecases/get_avatars_usecase.dart';
import '../controllers/avatar_controller.dart';

class AvatarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvatarDataSource>(() => AvatarDataSourceImpl());
    Get.lazyPut<AvatarRepository>(() => AvatarRepositoryImpl(Get.find()));
    Get.lazyPut<GetAvatarsUseCase>(() => GetAvatarsUseCase(Get.find()));
    Get.lazyPut<AvatarController>(() => AvatarController(Get.find()));
  }
}
