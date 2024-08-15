import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_book/core/failure/failure.dart';
import 'package:hotel_book/features/dashboard/data/data_source/remote/room_remote_data_source.dart';
import 'package:hotel_book/features/dashboard/data/model/room.dart';
import 'package:hotel_book/features/dashboard/presentation/state/room_state.dart';
import 'package:hotel_book/features/dashboard/presentation/view/dashboard_view.dart';

final dashboardViewModelProvider =
    StateNotifierProvider<DashboardViewModel, RoomState>((ref) {
  final roomDataSource = ref.read(roomDataSourceProvider);
  return DashboardViewModel(roomDataSource);
});

class DashboardViewModel extends StateNotifier<RoomState> {
  final RoomDataSource _roomDataSource;

  DashboardViewModel(this._roomDataSource) : super(RoomState.initial()) {
    getRooms();
  }

  Future resetState() async {
    state = RoomState.initial();
    getRooms();
  }

  Future getRooms() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final rooms = currentState.rooms;
    final hasReachedMax = currentState.hasMaxReached;

    if (!hasReachedMax) {
      final result = await _roomDataSource.getRooms(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasMaxReached: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasMaxReached: true, isLoading: false);
          } else {
            state = state.copyWith(
              rooms: [...rooms, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}
