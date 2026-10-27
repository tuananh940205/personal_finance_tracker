// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_tracker/main.dart';

void main() {
  testWidgets('shows financial overview and expense transactions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PersonalFinanceApp());

    expect(find.text('Personal Finance Tracker'), findsOneWidget);
    expect(find.text('18000000 VND'), findsOneWidget);
    expect(find.text('Tổng thu nhập: 20000000 VND'), findsOneWidget);
    expect(find.text('Tổng chi tiêu: 2000000 VND'), findsOneWidget);
    expect(find.text('Ăn uống'), findsOneWidget);
    expect(find.text('Tiền điện'), findsOneWidget);
  });
}
