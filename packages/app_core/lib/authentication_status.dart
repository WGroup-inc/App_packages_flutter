part of 'app_options.dart';

class AuthenticationStatus {
  AuthenticationStatus._({@required this.user});

  final User user;

  bool get isSignedIn => user != null;

  factory AuthenticationStatus.notSignedIn() {
    return AuthenticationStatus._(user: null);
  }

  factory AuthenticationStatus.signedIn({@required User user}) {
    assert(user != null);
    return AuthenticationStatus._(user: user);
  }
}