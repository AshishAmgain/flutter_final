import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hotel_book/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:hotel_book/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/user_entity.dart';
import 'package:riverpod/riverpod.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }

  AuthRemoteRepository(this._authRemoteDataSource);
  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return _authRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) {
    return _authRemoteDataSource.registerUser(user);
  }

  // @override
  // Future<Either<Failure, bool>> sendOtp(String email) {
  //   return _authRemoteDataSource.sendOtp(email);
  // }
}
