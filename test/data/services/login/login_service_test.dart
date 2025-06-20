import 'package:cos/data/services/login/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../testing/mocks/mocks.dart';

void main() {
  late SharedPreferencesAsyncMock sharedPreferencesMock;
  late LoginService loginService;

  setUp(() {
    sharedPreferencesMock = SharedPreferencesAsyncMock();
    loginService = LoginService(sharedPreferences: sharedPreferencesMock);
  });

  group('LoginService', () {
    const testEmail = 'test@example.com';
    const loginKey = 'user_login';

    test('saveUserLogin saves email to SharedPreferences', () async {
      when(() => sharedPreferencesMock.setString(loginKey, testEmail))
          .thenAnswer((_) async => true);

      await loginService.saveUserLogin(testEmail);

      verify(() => sharedPreferencesMock.setString(loginKey, testEmail)).called(1);
    });

    test('getUserLogin retrieves email from SharedPreferences', () async {
      when(() => sharedPreferencesMock.getString(loginKey))
          .thenAnswer((_) async => testEmail);

      final result = await loginService.getUserLogin();

      expect(result, testEmail);
      verify(() => sharedPreferencesMock.getString(loginKey)).called(1);
    });

    test('getUserLogin returns null if no email is saved', () async {
      when(() => sharedPreferencesMock.getString(loginKey))
          .thenAnswer((_) async => null);

      final result = await loginService.getUserLogin();

      expect(result, isNull);
      verify(() => sharedPreferencesMock.getString(loginKey)).called(1);
    });
  });
} 