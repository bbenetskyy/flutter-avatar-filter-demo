import '../../domain/entities/avatar.dart';
import '../../domain/repositories/avatar_repository.dart';
import '../datasources/avatar_datasource.dart';

class AvatarRepositoryImpl implements AvatarRepository {
  final AvatarDataSource dataSource;
  AvatarRepositoryImpl(this.dataSource);

  @override
  Future<List<Avatar>> getAvatars() async {
    final all = await dataSource.getAvatars();
    return all.map((m) => m.toEntity()).toList();
  }
}
