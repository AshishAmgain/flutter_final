import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel_book/app/constants/api_endpoint.dart';
import 'package:hotel_book/core/failure/failure.dart';
import 'package:hotel_book/core/networking/remote/http_service.dart';
import 'package:hotel_book/features/dashboard/data/model/room.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomDataSourceProvider = Provider.autoDispose(
  (ref) => RoomDataSource(ref.read(httpServiceProvider)),
);

class RoomDataSource {
  final Dio _dio;

  RoomDataSource(this._dio);

  Future<Either<Failure, List<Room>>> getRooms(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.getRooms,
        data: {
          'page': page,
          'limit': ApiEndpoints.roomlimit,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
        print(data);
        final rooms = data.map((e) => Room.fromJson(e)).toList();
        return Right(rooms);
      } else {
        return Left(Failure(
          error: response.data["message"],
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
