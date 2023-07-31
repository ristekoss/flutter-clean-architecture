import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String name;
  final String email;
  final String imageUrl;

  const User({required this.name, required this.email, required this.imageUrl, required this.id,});

  @override
  List<Object?> get props => [id, name, email, imageUrl];
}