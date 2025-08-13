// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart'; // This brings in all the Flutter widgets, like Lego blocks for building screens.
import 'package:flutter_test/flutter_test.dart'; // This gives us special tools to test our app, like a robot that can tap buttons for us.

import 'package:section2_flutter/main.dart'; // This brings in our main app code so we can test it.

void main() {
  // This is where our test starts, like the first page of a story.
  testWidgets('HomeScreen navigation smoke test', (WidgetTester tester) async {
    // This is a test. The robot will pretend to use our app.
    await tester.pumpWidget(
        const MyApp()); // The robot builds our app on its test phone.
    // Check for all three navigation cards
    expect(find.text('Task 6: Simple List (SnackBar)'),
        findsOneWidget); // The robot looks for the first card by its text.
    expect(find.text('Task 7: Login Form (Validation)'),
        findsOneWidget); // The robot looks for the second card.
    expect(find.text('Task 8: Users API (Loading + Error)'),
        findsOneWidget); // The robot looks for the third card.
    // Tap the first card and check navigation
    await tester.tap(find.text(
        'Task 6: Simple List (SnackBar)')); // The robot taps the first card.
    await tester
        .pumpAndSettle(); // The robot waits for the screen to finish changing.
    // Check for one of the list items
    expect(find.text('Item 1'),
        findsOneWidget); // The robot looks for 'Item 1' to make sure the list screen showed up.
    // Go back
    await tester.pageBack(); // The robot presses the back button.
    await tester.pumpAndSettle(); // Wait for the screen to go back.
    // Tap the second card and check navigation
    await tester.tap(
        find.text('Task 7: Login Form (Validation)')); // Tap the second card.
    await tester.pumpAndSettle(); // Wait for the screen to change.
    // Check for the email field
    expect(find.widgetWithText(TextFormField, 'Email'),
        findsOneWidget); // Look for the email input box.
    // Go back
    await tester.pageBack(); // Go back again.
    await tester.pumpAndSettle(); // Wait for the screen to go back.
    // Tap the third card and check navigation
    await tester.tap(find
        .text('Task 8: Users API (Loading + Error)')); // Tap the third card.
    await tester.pumpAndSettle(); // Wait for the screen to change.
    // Check for fallback UI: error or empty state
    final errorFinder =
        find.textContaining('Error:'); // Look for any error message.
    final emptyFinder = find
        .text('No users found'); // Or look for the 'No users found' message.
    expect(
        errorFinder.evaluate().isNotEmpty || emptyFinder.evaluate().isNotEmpty,
        true,
        reason:
            'Should show error or empty state'); // Make sure at least one of those messages is on the screen.
  }); // End of our test story.
}
