// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hotel_book/features/auth/domain/entity/user_entity.dart';
// import 'package:hotel_book/features/auth/presentation/view/register_view.dart';
// import 'package:hotel_book/features/auth/domain/use_case/auth_use_case.dart';
// import 'package:hotel_book/features/auth/presentation/viewmodel/auth_view_model.dart';
// import 'package:mockito/mockito.dart';
// import '../../test/unit_test/auth_test.mocks.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   late AuthUseCase mockAuthUsecase;

//   setUp(() {
//     mockAuthUsecase = MockAuthUseCase();
//   });

//   testWidgets('Register form test', (tester) async {
//     when(mockAuthUsecase.registerUser(any))
//         .thenAnswer((_) async => Right(true));

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           authViewModelProvider.overrideWith(
//             (ref) => AuthViewModel(mockAuthUsecase),
//           ),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: RegisterView(),
//         ),
//       ),
//     );

//     await tester.pumpAndSettle();

//     // Enter text into the form fields
//     await tester.enterText(find.byType(TextFormField).at(0), 'Ashish');
//     await tester.enterText(find.byType(TextFormField).at(1), 'Amgain');
//     await tester.enterText(
//         find.byType(TextFormField).at(2), 'ashishamgain@gmail.com');
//     await tester.enterText(find.byType(TextFormField).at(3), 'ashish123');

//     // Tap on the sign-up button
//     final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');
//     await tester.tap(signUpButton);

//     await tester.pumpAndSettle();

//     // Verify that the registerUser method is called with the correct UserEntity
//     verify(
//       mockAuthUsecase.registerUser(
//         UserEntity(
//           firstName: 'Ashish',
//           lastName: 'Amgain',
//           email: 'ashishamgain@gmail.com',
//           password: 'ashish123',
//         ),
//       ),
//     ).called(1);

//     // Check if the snackbar is displayed
//     expect(find.text('Successfully registered'), findsOneWidget);
//   });
// }
