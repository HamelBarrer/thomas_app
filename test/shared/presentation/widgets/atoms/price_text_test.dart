import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/price_text.dart';

void main() {
  group('PriceText Widget', () {
    testWidgets('should display formatted price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: PriceText(price: 99.99))),
      );

      expect(find.text('\$99.99'), findsOneWidget);
    });

    testWidgets('should display price with custom font size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PriceText(price: 99.99, fontSize: 24)),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('\$99.99'));
      expect(textWidget.style?.fontSize, 24);
    });

    testWidgets('should display price with custom color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: PriceText(price: 99.99, color: Colors.red)),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('\$99.99'));
      expect(textWidget.style?.color, Colors.red);
    });

    testWidgets('should display price with custom font weight', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PriceText(price: 99.99, fontWeight: FontWeight.bold),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('\$99.99'));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('should format large prices correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: PriceText(price: 1234.56))),
      );

      expect(find.text('\$1234.56'), findsOneWidget);
    });

    testWidgets('should handle zero price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: PriceText(price: 0))),
      );

      expect(find.text('\$0.00'), findsOneWidget);
    });
  });
}
