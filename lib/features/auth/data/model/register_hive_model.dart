import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_book/app/constants/hive_table_constant.dart';
import 'package:hotel_book/features/auth/domain/entity/user_entity.dart';
import 'package:uuid/uuid.dart';
import 'package:riverpod/riverpod.dart';
part 'register_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String? profilePicture;

  UserHiveModel({
    String? userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.profilePicture,
  }) : userId = userId ?? const Uuid().v4();

  UserHiveModel.empty()
      : this(
          userId: '',
          firstName: '',
          lastName: '',
          email: '',
          password: '',
          profilePicture: '',
        );

  //convert hive object to Entity
  UserEntity toEntity() => UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password);

  //convert Entity to Hive Database
  UserHiveModel toUserModel(UserEntity entity) => UserHiveModel(
      userId: const Uuid().v4(),
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      profilePicture: entity.profilePicture);
//convert Entity List to Hive List
  List<UserHiveModel> toUserModelList(List<UserEntity> entities) =>
      entities.map((entity) => toUserModel(entity)).toList();

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
