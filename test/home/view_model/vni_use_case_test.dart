import 'package:flutter_test/flutter_test.dart';
import 'package:cos/home/view_model/vni_use_case.dart';

void main() {
  final validator = VNIValidationUseCase();

  group('VNIValidationUseCase', () {
    test('accepts valid VINs', () {
      expect(validator('1M8GDM9AXKP042788'), isNull);
      expect(validator('1HGBH41JXMN109186'), isNull);
    });

    test('validates check digit', () {
      expect(validator('1M8GDM9A1KP042788'), 'Invalid VIN check digit');
    });

    test('checks for invalid character I', () {
      expect(validator('1M8GDM9AIKP042788'), 'VIN cannot contain the letters I, O, or Q');
      expect(validator('1M8GDM9AOKP042788'), 'VIN cannot contain the letters I, O, or Q');
      expect(validator('1M8GDM9AQKP042788'), 'VIN cannot contain the letters I, O, or Q');
    });

    test('checks for short VNIs input', () {
      expect(validator('1M8GDM9AXKP04278'), 'VIN must be exactly 17 characters long');
    });

    test('checks for long VNIs input', () {
      expect(validator('1M8GDM9AXKP0427881'), 'VIN must be exactly 17 characters long');
    });

    test('rejects empty VNIs input', () {
      expect(validator(''), 'VNI cannot be empty');
    });

    test('rejects non-alphanumeric character', () {
      expect(validator('1M8GDM9A@KP042788'), 'VIN can only contain letters A-H, J-N, P-R, T-Z and numbers 0-9');
    });
  });
}
