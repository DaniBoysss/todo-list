import 'package:equatable/equatable.dart';

class AddTaskEntity extends Equatable {
  String? id;
  String? title;
  String? description;
  String? data;

  AddTaskEntity({
    this.id,
    this.title,
    this.description,
    this.data,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        data,
      ];
}
