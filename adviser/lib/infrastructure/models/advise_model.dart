import 'package:adviser/domain/entities/advise_entity.dart';

class AdviseModel extends AdviseEntity {
  AdviseModel({required String advise, required int id})
      : super(advise: advise, id: id);

  factory AdviseModel.fromJson(Map<String, dynamic> json) {
    return AdviseModel(advise: json['slip']['advice'], id: json['slip']['id']);
  }
}
