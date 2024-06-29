import 'package:hotel_book/core/failure/failure.dart';
import 'package:hotel_book/core/networking/local/hive_service.dart';
import 'package:hotel_book/features/auth/data/model/register_hive_model.dart';
import 'package:hotel_book/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';

final authLocalDataSourceProvider = Provider((ref) {
  return AuthLocalDataSource(
      ref.read(hiveServiceProvider), ref.read(authHiveModelProvider));
});

class AuthLocalDataSource {
  final HiveService _hiveService;
  final UserHiveModel _userHiveModel;
  AuthLocalDataSource(this._hiveService, this._userHiveModel);
  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      await _hiveService.registerUser(_userHiveModel.toUserModel(user));
      return const Right(true);
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      UserHiveModel? user = await _hiveService.login(email, password);
      return const Right(true);
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }
}
