import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_book/features/dashboard/presentation/view/home_screen.dart';
import 'package:hotel_book/features/dashboard/presentation/view/screen/home_screen.dart';
import 'package:hotel_book/features/dashboard/presentation/viewmodel/room_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
//kjg
class MockRoomViewModel extends Mock implements RoomViewModel {}

void main() {
  testWidgets('HomeView displays rooms and best deals',
      (WidgetTester tester) async {
    // Arrange
    final mockRoomViewModel = MockRoomViewModel();

    // Mock data for rooms
    when(mockRoomViewModel.rooms).thenReturn([
      // Add mock rooms here if needed
    ]);

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<RoomViewModel>.value(
          value: mockRoomViewModel,
          child: HomeView(),
        ),
      ),
    );

    // Verify that certain widgets are present
    expect(find.text('Welcome to Hotel-Book'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Best Deals'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator),
        findsNothing); // Adjust based on mock data

    // Optionally, interact with widgets and assert behavior
    // Example: Check if ListView shows mock data
    // expect(find.byType(ListView), findsOneWidget);

    // Trigger a frame and verify changes
    await tester.pumpAndSettle();
  });
}
