import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/core/utils/formatters.dart';

void main() {
  group('Formatters', () {
    group('formatCurrency', () {
      test('should format currency correctly', () {
        expect(Formatters.formatCurrency(99.99), '\$99.99');
        expect(Formatters.formatCurrency(1000.00), '\$1000.00');
        expect(Formatters.formatCurrency(0.99), '\$0.99');
      });

      test('should format with two decimal places', () {
        expect(Formatters.formatCurrency(50.0), '\$50.00');
        expect(Formatters.formatCurrency(100), '\$100.00');
      });

      test('should handle zero amount', () {
        expect(Formatters.formatCurrency(0), '\$0.00');
      });

      test('should format large numbers correctly', () {
        expect(Formatters.formatCurrency(1234567.89), '\$1234567.89');
      });
    });

    group('formatDate', () {
      test('should format date correctly', () {
        final date = DateTime(2024, 1, 15);
        expect(Formatters.formatDate(date), '15/01/2024');
      });

      test('should pad single digit day and month', () {
        final date = DateTime(2024, 3, 5);
        expect(Formatters.formatDate(date), '05/03/2024');
      });

      test('should handle end of year date', () {
        final date = DateTime(2024, 12, 31);
        expect(Formatters.formatDate(date), '31/12/2024');
      });

      test('should handle start of year date', () {
        final date = DateTime(2024, 1, 1);
        expect(Formatters.formatDate(date), '01/01/2024');
      });
    });
  });
}
