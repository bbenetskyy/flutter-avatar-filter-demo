import '../entities/avatar.dart';
import '../repositories/avatar_repository.dart';

class GetAvatarsUseCase {
  final AvatarRepository repository;
  GetAvatarsUseCase(this.repository);

  Future<List<Avatar>> call() => repository.getAvatars();
}
