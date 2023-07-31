
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:boilerplate/features/main/data/params/get_user_params.dart';
import 'package:boilerplate/features/main/domain/models/user.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_state.dart';

import '../../domain/use_cases/get_users_use_case.dart';

class MainCubit extends Cubit<MainState>{
  final GetUserUseCase getUserUseCase;
  MainCubit({required this.getUserUseCase}) : super(const MainState());

  bool isPalindrome(String value) {
    final text = value.replaceAll(" ", "").toLowerCase();
    int left = 0;
    int right = text.length - 1;

    while (left < right) {
      if (text[left] != text[right]) {
        return false;
      }
      left++;
      right--;
    }

    return true;
  }

  Future<List<User>> getUsers(int pageKey, PagingController controller) async {
    emit(state.copyWith(isLoading: true));
    
    final result = await getUserUseCase.execute(GetUserParams(pageKey: (pageKey ~/ 10) + 1));
    result.fold((l) {
      controller.error = l;
      emit(state.copyWith(
        isLoading: false,
      ));
    }, (r) {
      final newItems = r ?? [];
      final isLastPage = newItems.length < 10;
      if (isLastPage) {
        controller.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        controller.appendPage(newItems, nextPageKey);
      }
      emit(state.copyWith(
        isLoading: false,
        users: r
      ));
    });

    return state.users;
  }

  void selectUser(String username){
    emit(state.copyWith(
      selectedUserName: username
    ));
  }

  void login(String name){
    emit(state.copyWith(
      user: name,
    ));
  }
}