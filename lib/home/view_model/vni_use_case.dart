final class VNIValidationUseCase {
  static final _hasInvalidCharactersRegex = RegExp(r'[IOQ]');
  static final _hasNonAlphaNumericCharactersRegex = RegExp(r'^[A-HJ-NPR-Z0-9]+$');
  static final _weights = <int>[8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];
  static final _charValues = <String, int>{
    'A': 1,
    'B': 2,
    'C': 3,
    'D': 4,
    'E': 5,
    'F': 6,
    'G': 7,
    'H': 8,
    'J': 1,
    'K': 2,
    'L': 3,
    'M': 4,
    'N': 5,
    'P': 7,
    'R': 9,
    'S': 2,
    'T': 3,
    'U': 4,
    'V': 5,
    'W': 6,
    'X': 7,
    'Y': 8,
    'Z': 9,
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
  };

  String? call(String input) {
    if (input.isEmpty) {
      return 'VNI cannot be empty';
    }

    if (input.length != 17) {
      return 'VIN must be exactly 17 characters long';
    }

    final vin = input.toUpperCase();

    if (_hasInvalidCharactersRegex.hasMatch(vin)) {
      return 'VIN cannot contain the letters I, O, or Q';
    }

    if (!_hasNonAlphaNumericCharactersRegex.hasMatch(vin)) {
      return 'VIN can only contain letters A-H, J-N, P-R, T-Z and numbers 0-9';
    }

    if (!_validateCheckDigit(vin)) {
      return 'Invalid VIN check digit';
    }

    return null;
  }

  bool _validateCheckDigit(String vin) {
    int sum = 0;

    for (int i = 0; i < 17; i = i + 1) {
      if (i == 8) continue;

      final key = vin[i];
      sum += (_charValues[key] ?? 0) * _weights[i];
    }

    final remainder = sum % 11;
    final expectedCheckDigit = remainder == 10 ? 'X' : remainder.toString();

    return vin[8] == expectedCheckDigit;
  }
}
