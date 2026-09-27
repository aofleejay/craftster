import 'package:craftster/core/app_version.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('compare 1.0.0 to 1.0.1 should return true', () {
    final isLower = AppVersion.isLowerThan('1.0.0', '1.0.1');
    expect(isLower, isTrue);
  });

  test('compare 1.0.0 to 1.1.0 should return true', () {
    final isLower = AppVersion.isLowerThan('1.0.0', '1.1.0');
    expect(isLower, isTrue);
  });

  test('compare 1.0.0 to 2.0.0 should return true', () {
    final isLower = AppVersion.isLowerThan('1.0.0', '2.0.0');
    expect(isLower, isTrue);
  });

  test('compare 1.9.0 to 1.10.0 should return true', () {
    final isLower = AppVersion.isLowerThan('1.9.0', '1.10.0');
    expect(isLower, isTrue);
  });

  test('compare 1.0.0 to 1.0.0 should return false', () {
    final isLower = AppVersion.isLowerThan('1.0.0', '1.0.0');
    expect(isLower, isFalse);
  });

  test('compare 1.0.1 to 1.0.0 should return false', () {
    final isLower = AppVersion.isLowerThan('1.0.1', '1.0.0');
    expect(isLower, isFalse);
  });

  test('compare 1.1.0 to 1.0.0 should return false', () {
    final isLower = AppVersion.isLowerThan('1.1.0', '1.0.0');
    expect(isLower, isFalse);
  });

  test('compare 2.0.0 to 1.0.0 should return false', () {
    final isLower = AppVersion.isLowerThan('2.0.0', '1.0.0');
    expect(isLower, isFalse);
  });

  test('compare 1.10.0 to 1.9.0 should return false', () {
    final isLower = AppVersion.isLowerThan('1.10.0', '1.9.0');
    expect(isLower, isFalse);
  });
}
