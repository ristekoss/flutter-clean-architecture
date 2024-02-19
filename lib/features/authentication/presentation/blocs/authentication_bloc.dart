import 'package:boilerplate/features/authentication/presentation/blocs/states/post_login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/authentication_use_cases.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';
import 'events/login_refresh_events.dart';
import 'events/post_login_events.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationStates> {
  final AuthenticationUseCases _useCases;

  AuthenticationBloc(this._useCases) : super(PostLoginInitState()) {
    on<PostLoginEvent>(_onPostLoginEvent);
    on<LoginRefreshEvent>(_onLoginRefreshEvent);
  }

  Future _onPostLoginEvent(
      PostLoginEvent event, Emitter<AuthenticationStates> emitter) async {
    emitter(PostLoginLoadingState());
    final response = await _useCases.postLogin(event.username, event.password);
    await response.fold(
      (l) {
        emitter(
          PostLoginErrorState(message: l.message ?? ''),
        );
      },
      (r) async {
        await _useCases.saveToken(r.token, r.token);
        emitter(PostLoginSuccessState(auth: r));
      },
    );
  }

  Future _onLoginRefreshEvent(
    LoginRefreshEvent event,
    Emitter<AuthenticationStates> emitter,
  ) async {
    if (state is PostLoginErrorState) {
      emitter(PostLoginInitState());
    }
  }
}
