import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/shared/presentation/widgets/atoms/app_badge.dart';

void main() {
  group('AppBadge Widget', () {
    group('Category Badge', () {
      testWidgets('should display category text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: AppBadge.category(text: 'ELECTRONICS')),
          ),
        );

        expect(find.text('ELECTRONICS'), findsOneWidget);
      });

      testWidgets('should display category icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: AppBadge.category(text: 'ELECTRONICS')),
          ),
        );

        expect(find.byIcon(Icons.category_rounded), findsOneWidget);
      });

      testWidgets('should display custom icon when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppBadge.category(
                text: 'ELECTRONICS',
                icon: Icons.phone_android,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.phone_android), findsOneWidget);
      });
    });

    group('Rating Badge', () {
      testWidgets('should display rating without count', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: AppBadge.rating(rating: '4.5')),
          ),
        );

        expect(find.text('4.5'), findsOneWidget);
        expect(find.byIcon(Icons.star_rounded), findsOneWidget);
      });

      testWidgets('should display rating with count', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppBadge.rating(rating: '4.5', count: '100'),
            ),
          ),
        );

        expect(find.text('4.5 (100)'), findsOneWidget);
      });
    });

    group('Featured Badge', () {
      testWidgets('should display default "Nuevo" text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: AppBadge.featured())),
        );

        expect(find.text('Nuevo'), findsOneWidget);
        expect(find.byIcon(Icons.star_rounded), findsOneWidget);
      });

      testWidgets('should display custom text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: AppBadge.featured(text: 'Destacado')),
          ),
        );

        expect(find.text('Destacado'), findsOneWidget);
      });
    });
  });
}
