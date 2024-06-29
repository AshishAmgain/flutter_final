import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? profilePicture;

  const UserEntity(
      {this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.profilePicture});

  @override
  List<Object?> get props =>
      [userId, firstName, lastName, email, password, profilePicture];
}
