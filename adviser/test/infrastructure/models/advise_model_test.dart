import 'dart:convert';

import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/infrastructure/models/advise_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final AdviseModel adviseModel = AdviseModel(advise: 'Test', id: 1);

  test('Model is subclass of Advise entity', () {
    // arrange

    // act

    // assert
    expect(adviseModel, isA<AdviseEntity>());
  });

  group('fromJson factory', () {
    test('Returns valid model if JSON advise is correct', () {
      // arrange
      Map<String, dynamic> advise = json.decode(fixture('advise.json'));

      // act
      final res = AdviseModel.fromJson(advise);

      // assert
      expect(res, adviseModel);
    });
  });
}
