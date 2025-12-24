import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen displays Total Spending and Scan Receipt', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    // Verify "Total Spending" text is present
    expect(find.text('Total Spending'), findsOneWidget);

    // Verify the amount is present
    expect(find.text('\$1,234.56'), findsOneWidget);

    // Verify "Scan Receipt" FAB is present
    // expect(find.text('Scan Receipt'), findsOneWidget); // Removed label
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);

    // Verify "Recent Transactions" header is present
    expect(find.text('Recent Transactions'), findsOneWidget);

    // Verify some mock transactions
    expect(find.text('Starbucks'), findsOneWidget);
    expect(find.text('Uber'), findsOneWidget);
  });
}
