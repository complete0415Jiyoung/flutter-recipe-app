import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/mepper/user_mepper.dart';
import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/domain/roepositpry/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserDataSource _dataSource;
  AuthRepositoryImpl({required UserDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<User> getUser() async {
    final userDto = await _dataSource.getUserDto();
    return userDto.toUser();
  }
}
