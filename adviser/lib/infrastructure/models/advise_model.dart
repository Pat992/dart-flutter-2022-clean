import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:equatable/equatable.dart';

class AdviseModel extends AdviseEntity with EquatableMixin {
  AdviseModel({required String advise, required int id})
      : super(advise: advise, id: id);

  factory AdviseModel.fromJson(Map<String, dynamic> json) {
    return AdviseModel(advise: json['slip']['advice'], id: json['slip']['id']);
  }

  @override
  List<Object?> get props => [advise, id];
}
