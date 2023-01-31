import 'package:equatable/equatable.dart';
import 'package:lista_tarefas/core/features/domain/entities/person_entity.dart';

class UserModel extends Equatable {
  final String? id;
  final String? token;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  const UserModel({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        phoneNumber: json['phoneNumber'] as String,
        password: json['password'] as String,
        id: json['id'] as String? ?? '',
        token: json['token'] as String? ?? '',
      );

  static Map<String, dynamic> toJson(UserModel instance) => <String, dynamic>{
        'name': instance.name,
        'email': instance.email,
        'phoneNumber': instance.phoneNumber,
        'password': instance.password,
        'id': instance.id,
        'token': instance.token,
      };

  PersonEntity toEntity() => PersonEntity(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
      );

  @override
  List<Object?> get props => [id, token, name, email, phoneNumber, password];
}
