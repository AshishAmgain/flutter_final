import 'package:hotel_book/features/dashboard/data/model/room.dart';

class RoomState {
  final List<Room> rooms;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  RoomState({
    required this.rooms,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
  });

  factory RoomState.initial() {
    return RoomState(
      rooms: [],
      isLoading: false,
      hasMaxReached: false,
      page: 0,
    );
  }

  RoomState copyWith({
    List<Room>? rooms,
    bool? isLoading,
    bool? hasMaxReached,
    int? page,
  }) {
    return RoomState(
      rooms: rooms ?? this.rooms,
      isLoading: isLoading ?? this.isLoading,
      hasMaxReached: hasMaxReached ?? this.hasMaxReached,
      page: page ?? this.page,
    );
  }
}
