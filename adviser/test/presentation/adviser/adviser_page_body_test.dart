import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:adviser/presentation/adviser/widgets/advise_field.dart';
import 'package:adviser/presentation/adviser/widgets/advise_page_body.dart';
import 'package:adviser/presentation/adviser/widgets/custom_button.dart';
import 'package:adviser/presentation/adviser/widgets/error_message.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviserBloc extends MockBloc<AdviserEvent, AdviserState>
    implements AdviserBloc {}

class FakeAdviserEvent extends Fake implements AdviserEvent {}

class FakeAdviserState extends Fake implements AdviserState {}

// Material app is required, scaffold is advised
class TestScaffoldWrapper extends StatelessWidget {
  final Widget child;
  const TestScaffoldWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}

void main() {
  late MockAdviserBloc mockAdviserBloc;

  setUp(() {
    mockAdviserBloc = MockAdviserBloc();
  });

  group('AdvisePageBody test', () {
    setUpAll(() {
      // register fallback values -> null safety
      registerFallbackValue(FakeAdviserEvent());
      registerFallbackValue(FakeAdviserState());
    });

    // define finders
    final textFinder = find.byType(Text);
    final buttonFinder = find.byType(CustomButton);
    final loadingFinder = find.byType(CircularProgressIndicator);
    final adviseFinder = find.byType(AdviseField);
    final errorFinder = find.byType(ErrorMessage);

    testWidgets('If initial state, button and 2 texts are in widget',
        (tester) async {
      // arrange
      // for cubits -> whenListen(mockAdviserBloc, Stream.fromIterable([AdviserInitial()]));
      when(() => mockAdviserBloc.state).thenReturn(AdviserInitial());

      // build/pump
      // The widget needs to be wrapped in the mock adviser block, since it is using it
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdviserBloc>(
            create: (context) => mockAdviserBloc,
            child: const AdvisePageBody(),
          ),
        ),
      );

      // assert
      expect(textFinder, findsAtLeastNWidgets(2));
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets(
        'If loading state, button, circular loading indicator and 1 text are in widget',
        (tester) async {
      // arrange
      // for cubits -> whenListen(mockAdviserBloc, Stream.fromIterable([AdviserInitial()]));
      when(() => mockAdviserBloc.state).thenReturn(AdviserStateLoading());

      // build/pump
      // The widget needs to be wrapped in the mock adviser block, since it is using it
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdviserBloc>(
            create: (context) => mockAdviserBloc,
            child: const AdvisePageBody(),
          ),
        ),
      );

      // assert
      expect(textFinder, findsOneWidget);
      expect(buttonFinder, findsOneWidget);
      expect(loadingFinder, findsOneWidget);
    });

    testWidgets(
        'If loaded state, button, 2 texts and advise field are in widget',
        (tester) async {
      // arrange
      // for cubits -> whenListen(mockAdviserBloc, Stream.fromIterable([AdviserInitial()]));
      when(() => mockAdviserBloc.state)
          .thenReturn(AdviserStateLoaded(advise: 'advise'));

      // build/pump
      // The widget needs to be wrapped in the mock adviser block, since it is using it
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdviserBloc>(
            create: (context) => mockAdviserBloc,
            child: const AdvisePageBody(),
          ),
        ),
      );

      // assert
      expect(textFinder, findsAtLeastNWidgets(2));
      expect(buttonFinder, findsOneWidget);
      expect(adviseFinder, findsOneWidget);
    });

    testWidgets('If error state, button, 2 texts and error field are in widget',
        (tester) async {
      // arrange
      // for cubits -> whenListen(mockAdviserBloc, Stream.fromIterable([AdviserInitial()]));
      when(() => mockAdviserBloc.state)
          .thenReturn(AdviserStateError(errorMessage: 'error'));

      // build/pump
      // The widget needs to be wrapped in the mock adviser block, since it is using it
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdviserBloc>(
            create: (context) => mockAdviserBloc,
            child: const AdvisePageBody(),
          ),
        ),
      );

      // assert
      expect(textFinder, findsAtLeastNWidgets(2));
      expect(buttonFinder, findsOneWidget);
      expect(errorFinder, findsOneWidget);
    });
  });
}
