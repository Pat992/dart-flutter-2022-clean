// Mocks generated by Mockito 5.3.2 from annotations
// in adviser/test/infrastructure/repositories/theme_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ThemeLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeLocalDatasource extends _i1.Mock
    implements _i2.ThemeLocalDatasource {
  MockThemeLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> getThemeData() => (super.noSuchMethod(
        Invocation.method(
          #getThemeData,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<void> setThemeData({required bool? mode}) => (super.noSuchMethod(
        Invocation.method(
          #setThemeData,
          [],
          {#mode: mode},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<bool> getUseSystemTheme() => (super.noSuchMethod(
        Invocation.method(
          #getUseSystemTheme,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<void> setUseSystemTheme({required bool? useSystemTheme}) =>
      (super.noSuchMethod(
        Invocation.method(
          #setUseSystemTheme,
          [],
          {#useSystemTheme: useSystemTheme},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
