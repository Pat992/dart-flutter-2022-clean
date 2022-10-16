import 'dart:convert';

import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:adviser/infrastructure/models/advise_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviserRemoteDatasource {
  /// Request random advise from api
  /// Throws server exception if response code is not 200
  Future<AdviseEntity> get();
}

class AdviserRemoteDatasourceImpl implements AdviserRemoteDatasource {
  final http.Client client;

  AdviserRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviseEntity> get() async {
    final res = await client.get(Uri.parse('https://api.adviceslip.com/advice'),
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode != 200) {
      throw ServerException();
    }

    final body = json.decode(res.body);
    return AdviseModel.fromJson(body);
  }
}
