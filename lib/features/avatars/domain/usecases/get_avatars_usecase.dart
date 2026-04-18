import '../entities/avatar.dart';
import '../exceptions/avatar_exception.dart';
import '../repositories/avatar_repository.dart';

class GetAvatarsUseCase {
  final AvatarRepository _repository;
  GetAvatarsUseCase(this._repository);

  Future<List<Avatar>> call() async {
    final avatars = await _repository.getAvatars();
    if (avatars.isEmpty) throw const AvatarException('No avatars available.');
    return avatars..sort((a, b) => a.name.compareTo(b.name));
  }
}
