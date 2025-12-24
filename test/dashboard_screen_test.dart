import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen displays new design elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    // Verify "Total Spending (October)" text is present (Hero Card)
    expect(find.text('Total Spending (October)'), findsOneWidget);

    // Verify the new amount is present
    expect(find.text('\$3,450.20'), findsOneWidget);

    // Verify "+12%" badge
    expect(find.text('+12%'), findsOneWidget);

    // Verify Filters are present
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Office'), findsOneWidget);

    // Verify some mock transactions from the new design
    expect(find.text('Office Depot'), findsOneWidget);
    expect(find.text('Starbucks'), findsOneWidget);

    // Verify FAB is NOT present (as it wasn't in the design)
    expect(find.byType(FloatingActionButton), findsNothing);
  });
}
