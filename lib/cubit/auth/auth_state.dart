part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {
  final bool isLoading;

  const LoadingAuthState(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

class LogoutState extends AuthState {}

class FailureAuthState extends AuthState {
  final String errorMessage;
  final bool isError;

  const FailureAuthState(this.errorMessage, this.isError);

  @override
  List<Object> get props => [errorMessage, isError];

  @override
  String toString() {
    print("**** Authentication Failure State Message .... : ${errorMessage}");
    return errorMessage;
  }
}

class SuccessAuthState extends AuthState {
  final String errorMessage;
  final bool isError;

  const SuccessAuthState(this.errorMessage, this.isError);

  @override
  List<Object> get props => [errorMessage, isError];

  @override
  String toString() {
    print("**** Authentication Failure State Message .... : ${errorMessage}");
    return errorMessage;
  }
}


class LoaingAuthMessages extends AuthState {
  final String messages;

  const LoaingAuthMessages(this.messages);

  @override
  List<Object> get props => [messages];

  @override
  String toString() {
    print("**** Authentication Failure State Message .... : ${messages}");
    return messages;
  }
}
