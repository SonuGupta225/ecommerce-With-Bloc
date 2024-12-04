
abstract class LoginState{}
class InitState extends LoginState{}
class LoadingState extends LoginState{}
class LoadedState extends LoginState{}
class ErrorState extends LoginState{
  String msg;
  ErrorState({required this.msg});
}