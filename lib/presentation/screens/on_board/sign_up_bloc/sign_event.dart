abstract class SignupEvents{}
class SignEvent extends SignupEvents{
  String? name;
  String? mobile_number;
  String? email;
  String? password;
  SignEvent({required this.name,required this.mobile_number,required this.email,required this.password,});
}