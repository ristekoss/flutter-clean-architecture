import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:boilerplate/features/main/data/params/get_user_params.dart';
import 'package:boilerplate/features/main/domain/models/user.dart';
import 'package:boilerplate/features/main/domain/use_cases/get_users_use_case.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_cubit.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUsersUseCase extends Mock implements GetUserUseCase {}

class FakeGetUsersParams extends Fake implements GetUserParams {}

void main() {
  late GetUserUseCase getUserUseCase;
  late MainCubit cubit;

  const dummyUser = User(
      name: "Yudha",
      email: "career@yudha.com",
      imageUrl: "-",
      id: 0);

  setUp(() {
    getUserUseCase = MockGetUsersUseCase();
    cubit = MainCubit(getUserUseCase: getUserUseCase);
    registerFallbackValue(FakeGetUsersParams());
  });

  blocTest<MainCubit, MainState>(
    "Initial Cubit Test",
    build: () => cubit,
    expect: () => [],
  );

  blocTest<MainCubit, MainState>(
    "Login Test",
    build: () => cubit,
    act: (bloc) => {bloc.login("Yudha")},
    expect: () => [const MainState(user: "Yudha")],
  );

  blocTest<MainCubit, MainState>(
    "Select User Test",
    build: () => cubit,
    act: (bloc) => {bloc.selectUser("Yudha")},
    expect: () => [const MainState(selectedUserName: "Yudha")],
  );

  blocTest<MainCubit, MainState>(
      "Get Users Test",
      build: () => cubit,
      act: (bloc) async {
        List<User>? users;
        users = [];
        users.add(dummyUser);

        when(() => getUserUseCase.execute(any()))
            .thenAnswer((invocation) async => Right(users));

        await cubit.getUsers(0, PagingController(firstPageKey: 0));

        verify(() => getUserUseCase.execute(any()));
      },
      expect: () => [
        const MainState(isLoading: true),
        const MainState(users: [dummyUser])],
  );
}
