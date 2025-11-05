import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/gradient_button.dart';

void main() {
  group('GradientButton Widget', () {
    testWidgets('should display button text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientButton(onPressed: () {}, text: 'Test Button'),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientButton(
              onPressed: () {
                pressed = true;
              },
              text: 'Test Button',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(pressed, true);
    });

    testWidgets('should display icon when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientButton(
              onPressed: () {},
              text: 'Test Button',
              icon: Icons.shopping_cart,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('should show loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientButton(
              onPressed: () {},
              text: 'Test Button',
              isLoading: true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsNothing);
    });

    testWidgets('should not call onPressed when isLoading is true', (
      tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientButton(
              onPressed: () {
                pressed = true;
              },
              text: 'Test Button',
              isLoading: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(pressed, false);
    });

    testWidgets('should respect custom width and height', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientButton(
              text: 'Test',
              onPressed: () {},
              width: 200,
              height: 60,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(GradientButton),
          matching: find.byType(Container).first,
        ),
      );

      expect(container.constraints?.maxWidth, 200);
      expect(container.constraints?.maxHeight, 60);
    });
  });
}
