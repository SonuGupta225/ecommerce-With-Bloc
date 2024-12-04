abstract class LoginEvents{}
class LoginEvent extends LoginEvents{
  String password;
  String email;
  LoginEvent({required this.email,required this.password,});
}