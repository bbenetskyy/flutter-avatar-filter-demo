import 'package:get/get.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/usecases/get_avatars_usecase.dart';

class AvatarLoaderController extends GetxController {
  final GetAvatarsUseCase _useCase;
  AvatarLoaderController(this._useCase);

  final _allAvatars = <Avatar>[].obs;
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;

  RxList<Avatar> get allAvatars => _allAvatars;
  RxBool get isLoading => _isLoading;
  RxString get errorMessage => _errorMessage;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';
      _allAvatars.assignAll(await _useCase());
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }
}
