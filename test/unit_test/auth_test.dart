import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_book/features/auth/presentation/state/auth_state.dart';
import 'package:mockito/mockito.dart';

// Mock AuthUseCase
class MockAuthUseCase extends Mock implements AuthUseCase {}

//efew
// Mock LoginViewNavigator
class MockLoginViewNavigator extends Mock implements LoginViewNavigator {}

void main() {
  group('AuthState tests', () {
    test('AuthState initial', () {
      // Arrange
      final authState = AuthState.initial();

      // Assert
      expect(authState.isLoading, false);
      expect(authState.error, isNull);
      expect(authState.imageName, isNull);
    });

    test('AuthState copyWith - isLoading', () {
      // Arrange
      final authState =
          AuthState(isLoading: false, error: null, imageName: null);

      // Act
      final copiedState = authState.copyWith(isLoading: true);

      // Assert
      expect(copiedState.isLoading, true);
      expect(copiedState.error, isNull);
      expect(copiedState.imageName, isNull);
    });

    test('AuthState copyWith - error', () {
      // Arrange
      final authState =
          AuthState(isLoading: false, error: null, imageName: null);

      // Act
      final copiedState = authState.copyWith(error: 'Error message');

      // Assert
      expect(copiedState.isLoading, false);
      expect(copiedState.error, 'Error message');
      expect(copiedState.imageName, isNull);
    });

    test('AuthState copyWith - imageName', () {
      // Arrange
      final authState =
          AuthState(isLoading: false, error: null, imageName: null);

      // Act
      final copiedState = authState.copyWith(imageName: 'profile.jpg');

      // Assert
      expect(copiedState.isLoading, false);
      expect(copiedState.error, isNull);
      expect(copiedState.imageName, 'profile.jpg');
    });

    test('AuthState toString', () {
      // Arrange
      final authState =
          AuthState(isLoading: true, error: 'Error', imageName: 'image.jpg');

      // Act
      final result = authState.toString();

      // Assert
      expect(result,
          'AuthState(isLoading: true, error: Error, imageName: image.jpg)');
    });
  });
}

// Mock AuthUseCase class for testing
class AuthUseCase {}

// Mock LoginViewNavigator class for testing
class LoginViewNavigator {}
