// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hotel_book/core/failure/failure.dart';
// import 'package:hotel_book/features/auth/domain/use_case/auth_use_case.dart';
// import 'package:hotel_book/features/auth/presentation/view/login_view.dart';
// import 'package:hotel_book/features/auth/presentation/viewmodel/auth_view_model.dart';
// import 'package:mockito/mockito.dart';
// import '../../test/unit_test/auth_test.mocks.dart';
// import '../unit_test/auth_usecase_test.mocks.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   late AuthUseCase mockAuthUsecase;

//   setUp(() {
//     mockAuthUsecase = MockAuthUseCase();
//   });

//   testWidgets('Login with valid credentials and check navigation to dashboard',
//       (tester) async {
//     const correctEmail = 'ashishamgain@gmail.com';
//     const correctPassword = 'ashish123';

//     when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
//       final email = invocation.positionalArguments[0] as String;
//       final password = invocation.positionalArguments[1] as String;
//       return Future.value(email == correctEmail && password == correctPassword
//           ? const Right(true)
//           : Left(Failure(error: 'Invalid Credentials')));
//     });

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           authViewModelProvider.overrideWith(
//             (ref) => AuthViewModel(mockAuthUsecase),
//           ),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: const LoginStateful(),
//         ),
//       ),
//     );

//     await tester.pumpAndSettle();

//     // Enter valid credentials
//     await tester.enterText(find.byType(TextFormField).at(0), correctEmail);
//     await tester.enterText(find.byType(TextFormField).at(1), correctPassword);

//     // Tap on the login button
//     final loginButton = find.widgetWithText(ElevatedButton, 'Login');
//     await tester.tap(loginButton);

//     await tester.pumpAndSettle();

//     // Check if the dashboard view is displayed
//     expect(find.text('Dashboard View'), findsOneWidget);
//   });

//   testWidgets('Login with invalid credentials and check snackbar message',
//       (tester) async {
//     const correctEmail = 'ashishamgain@gmail.com';
//     const correctPassword = 'ashish123';

//     when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
//       final email = invocation.positionalArguments[0] as String;
//       final password = invocation.positionalArguments[1] as String;
//       return Future.value(email == correctEmail && password == correctPassword
//           ? const Right(true)
//           : Left(Failure(error: 'Invalid Credentials')));
//     });

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           authViewModelProvider.overrideWith(
//             (ref) => AuthViewModel(mockAuthUsecase),
//           ),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: const LoginView(),
//         ),
//       ),
//     );

//     await tester.pumpAndSettle();

//     // Enter invalid credentials
//     await tester.enterText(
//         find.byType(TextFormField).at(0), 'invalidemail@gmail.com');
//     await tester.enterText(find.byType(TextFormField).at(1), 'wrongpassword');

//     // Tap on the login button
//     final loginButton = find.widgetWithText(ElevatedButton, 'Login');
//     await tester.tap(loginButton);

//     await tester.pumpAndSettle();

//     // Check if the snackbar with error message is displayed
//     expect(find.byType(SnackBar), findsOneWidget);
//   });
// }










// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hotel_book/core/failure/failure.dart';
// import 'package:hotel_book/features/auth/domain/use_case/auth_use_case.dart';
// import 'package:mockito/mockito.dart';

// import '../unit_test/auth_usecase_test.mocks.dart';

// void main() {
//   late AuthUseCase mockAuthUsecase;
//   setUp(() {
//     mockAuthUsecase = MockAuthUseCase();
//   });

//   testWidgets(
//       'Login with username and password and check weather dashboard opens or not',
//       (tester) async {
//     // Arrange
//     const correctUsername = 'kiran';
//     const correctPassword = 'kiran123';

//     when(mockAuthUsecase.loginStudent(any, any)).thenAnswer((invocation) {
//       final username = invocation.positionalArguments[0] as String;
//       final password = invocation.positionalArguments[1] as String;
//       return Future.value(
//           username == correctUsername && password == correctPassword
//               ? const Right(true)
//               : Left(Failure(error: 'Invalid Credentails')));
//     });
  
// }
