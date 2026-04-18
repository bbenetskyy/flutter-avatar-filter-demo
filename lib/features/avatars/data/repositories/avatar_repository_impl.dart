import '../../domain/entities/avatar.dart';
import '../../domain/exceptions/avatar_exception.dart';
import '../../domain/repositories/avatar_repository.dart';
import '../datasources/avatar_datasource.dart';

class AvatarRepositoryImpl implements AvatarRepository {
  final AvatarDataSource _dataSource;
  AvatarRepositoryImpl(this._dataSource);

  @override
  Future<List<Avatar>> getAvatars() async {
    try {
      return (await _dataSource.getAvatars()).map((m) => m.toEntity()).toList();
    } on Exception catch (e) {
      throw AvatarException('Failed to fetch avatars: $e');
    }
  }
}
