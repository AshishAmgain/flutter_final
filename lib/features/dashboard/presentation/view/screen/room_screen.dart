// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hotel_book/features/dashboard/presentation/viewmodel/room_view_model.dart'; // Adjust based on your provider setup

// class RoomView extends ConsumerStatefulWidget {
//   const RoomView({Key? key}) : super(key: key);

//   @override
//   _RoomViewState createState() => _RoomViewState();
// }

// class _RoomViewState extends ConsumerState<RoomView> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(roomsViewModelProvider);

//     return NotificationListener(
//       onNotification: (notification) {
//         if (notification is ScrollEndNotification) {
//           if (_scrollController.position.extentAfter == 0) {
//             ref.read(roomsViewModelProvider.notifier).getRooms();
//           }
//         }
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Rooms'),
//           actions: [
//             TextButton.icon(
//               onPressed: () {
//                 ref.read(roomsViewModelProvider.notifier).resetState();
//               },
//               icon: const Icon(Icons.refresh),
//               label: const Text('Refresh'),
//             ),
//           ],
//         ),
//         body: RefreshIndicator(
//           color: Colors.green,
//           backgroundColor: Colors.amberAccent,
//           onRefresh: () async {
//             ref.read(roomsViewModelProvider.notifier).resetState();
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView.separated(
//                     separatorBuilder: (context, index) => const Divider(),
//                     controller: _scrollController,
//                     itemCount: state.rooms.length,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final room = state.rooms[index];
//                       return ListTile(
//                         title: Text(room.name),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(room.description),
//                             SizedBox(height: 8),
//                             // Example to show images, adjust as per your Room model
//                             SizedBox(
//                               height: 100,
//                               child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: room.images.length,
//                                 itemBuilder: (context, imageIndex) {
//                                   final imageUrl = room.images[imageIndex];
//                                   return Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Image.network(
//                                       imageUrl,
//                                       width: 100,
//                                       height: 100,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 if (state.isLoading)
//                   const CircularProgressIndicator(color: Colors.red),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//adding sensors here
// phone shaking sensor refresh the window



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_book/features/dashboard/presentation/viewmodel/room_view_model.dart'; // Adjust based on your provider setup
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';

class RoomView extends ConsumerStatefulWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  _RoomViewState createState() => _RoomViewState();
}

class _RoomViewState extends ConsumerState<RoomView> {
  final ScrollController _scrollController = ScrollController();
  AccelerometerEvent? _previousEvent;
  final double _shakeThreshold = 15.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen(_onAccelerometerEvent);
  }

  void _onAccelerometerEvent(AccelerometerEvent event) {
    if (_previousEvent == null) {
      _previousEvent = event;
      return;
    }

    double deltaX = event.x - _previousEvent!.x;
    double deltaY = event.y - _previousEvent!.y;
    double deltaZ = event.z - _previousEvent!.z;

    double magnitude =
        sqrt(deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ);

    if (magnitude > _shakeThreshold) {
      ref.read(roomsViewModelProvider.notifier).resetState();
    }

    _previousEvent = event;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(roomsViewModelProvider);

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (_scrollController.position.extentAfter == 0) {
            ref.read(roomsViewModelProvider.notifier).getRooms();
          }
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rooms'),
          actions: [
            TextButton.icon(
              onPressed: () {
                ref.read(roomsViewModelProvider.notifier).resetState();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
        body: RefreshIndicator(
          color: Colors.green,
          backgroundColor: Colors.amberAccent,
          onRefresh: () async {
            ref.read(roomsViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    controller: _scrollController,
                    itemCount: state.rooms.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final room = state.rooms[index];
                      return ListTile(
                        title: Text(room.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(room.description),
                            SizedBox(height: 8),
                            // Example to show images, adjust as per your Room model
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: room.images.length,
                                itemBuilder: (context, imageIndex) {
                                  final imageUrl = room.images[imageIndex];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.network(
                                      imageUrl,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (state.isLoading)
                  const CircularProgressIndicator(color: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
