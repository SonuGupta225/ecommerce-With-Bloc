
abstract class SignupState{}
class SInitState extends SignupState{}
class SLoadingState extends SignupState{}
class SLoadedState extends SignupState{}
class SErrorState extends SignupState{
  String msg;
  SErrorState({required this.msg});
}