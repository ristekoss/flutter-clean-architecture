import 'dart:developer';

import 'package:boilerplate/features/authentication/presentation/blocs/states/post_login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/authentication_use_cases.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';
import 'events/post_login_events.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationStates> {
  final AuthenticationUseCases _useCases;

  AuthenticationBloc(this._useCases) : super(PostLoginInitState()) {
    on<PostLoginEvent>(_onPostLoginEvent);
  }

  Future _onPostLoginEvent(
      PostLoginEvent event, Emitter<AuthenticationStates> emitter) async {
    emitter(PostLoginLoadingState());
    try {
      final response =
          await _useCases.postLogin(event.username, event.password);
      response.fold(
        (l) {
          emitter(
            PostLoginErrorState(message: l.message ?? ''),
          );
        },
        (r) {
          emitter(PostLoginSuccessState(auth: r));
        },
      );
      log('kaga error');
    } catch (e) {
      log('error di sini');
      log(e.toString());
    }
  }
}
