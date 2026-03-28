import '../entities/avatar.dart';

abstract class AvatarRepository {
  Future<List<Avatar>> getAvatars();
}
