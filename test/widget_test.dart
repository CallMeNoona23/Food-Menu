import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_exam/main.dart';

void main() {
  testWidgets('Food Menu App renders title and items', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FoodMenuApp());

    // Verify that the AppBar title is displayed.
    expect(find.text('Gourmet Food Menu'), findsOneWidget);

    // Verify theme toggle button is present.
    expect(find.byIcon(Icons.nightlight_round), findsOneWidget);
  });
}
