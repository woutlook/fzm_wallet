import 'package:flutter_test/flutter_test.dart';
import 'package:fzm_wallet/models/wapi.dart';

void main() {
  group('WalletApi', () {
    test('hexToBytes should convert hex string to byte list correctly', () {
      const hexString = '48656c6c6f'; // "Hello" in hex
      final expectedBytes = [
        72,
        101,
        108,
        108,
        111
      ]; // ASCII values for "Hello"

      final result = hexToBytes(hexString);

      expect(result, expectedBytes);
    });

    test('hexToBytes should handle empty string', () {
      const hexString = '';
      final expectedBytes = <int>[];

      final result = hexToBytes(hexString);

      expect(result, expectedBytes);
    });

    test('hexToBytes should handle odd length hex string', () {
      const hexString = 'abc'; // Odd length hex string
      final expectedBytes = [10, 188]; // Corresponding byte values

      final result = hexToBytes(hexString);

      expect(result, expectedBytes);
    });

    test('hexToBytes should throw FormatException for invalid hex string', () {
      const hexString = 'zzzz'; // Invalid hex string

      expect(() => hexToBytes(hexString), throwsFormatException);
    });
  });
}
