import 'package:boilerplate/features/authentication/presentation/blocs/authentication_events.dart';

class PostLoginEvent implements AuthenticationEvent {
  final String username;
  final String password;

  const PostLoginEvent({
    required this.username,
    required this.password,
  });
}
