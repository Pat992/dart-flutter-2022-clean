// Mocks generated by Mockito 5.3.2 from annotations
// in adviser/test/infrastructure/repositories/adviser_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:adviser/domain/entities/advise_entity.dart' as _i2;
import 'package:adviser/infrastructure/datasources/adviser_remote_datasource.dart'
    as _i3;
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

class _FakeAdviseEntity_0 extends _i1.SmartFake implements _i2.AdviseEntity {
  _FakeAdviseEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AdviserRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdviserRemoteDatasource extends _i1.Mock
    implements _i3.AdviserRemoteDatasource {
  MockAdviserRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AdviseEntity> get() => (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
        ),
        returnValue: _i4.Future<_i2.AdviseEntity>.value(_FakeAdviseEntity_0(
          this,
          Invocation.method(
            #get,
            [],
          ),
        )),
      ) as _i4.Future<_i2.AdviseEntity>);
}
