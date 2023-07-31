import 'package:equatable/equatable.dart';

import '../../domain/models/user.dart';

class MainState extends Equatable {
  final bool isLoading;
  final String selectedUserName;
  final String user;
  final List<User> users;

  const MainState({
    this.isLoading = false,
    this.selectedUserName = "Selected User Name",
    this.user = "John Doe",
    this.users = const [],
});

  MainState copyWith({
    bool? isLoading,
    String? selectedUserName,
    String? user,
    List<User>? users,
  }){
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      selectedUserName: selectedUserName ?? this.selectedUserName,
      user: user ?? this.user,
      users: users ?? this.users,
    );
  }


  @override
  List<Object?> get props => [isLoading, user, selectedUserName, users];
}