import 'package:adviser/widget_test_example/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Text is correct', (tester) async {
    const widgetKey = Key('myWidget');
    const messageKey = Key('messageWidget');

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(
      title: 'title',
      message: 'message',
      key: widgetKey,
    ));

    // Create the Finders.
    final keyFinder = find.byKey(widgetKey);
    final messageKeyFinder = find.byKey(messageKey);
    final titleFinder = find.text('title');
    final messageFinder = find.text('message');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(keyFinder, findsOneWidget);
    expect(messageKeyFinder, findsOneWidget);
  });
}
