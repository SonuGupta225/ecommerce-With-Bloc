
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_bloc.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_event.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/ui_helper.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var nameController=TextEditingController();
  var mobController=TextEditingController();
  bool isHide=true;
  final _FORM_KEY=GlobalKey<FormState>();
  bool isEmailValid(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
  bool isPassValid(String password){
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _FORM_KEY,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Account',style: TextStyle(fontSize: 30,)),
                mySizeBox(),
                Container(
                  height: 75,
                  width: 500,
                  child: TextFormField(
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return '*required';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        label: Text('Name'),
                        hintText: 'Enter your Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                ),

                mySizeBox(),
                Container(
                  height: 75,
                  width: 500,
                  child: TextFormField(
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return '*required';
                      }else if (value.length<10||value.length>10){
                        return ' invalid mobile number';
                      }
                      return null;
                    },
                    controller: mobController,
                    decoration: InputDecoration(
                        label: Text('Mobile Number'),
                        hintText: 'Enter your Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                ),
                mySizeBox(),
                Container(
                  height: 75,
                  width: 500,
                  child: TextFormField(
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return '*required';
                      }else if (!isEmailValid(value)){
                        return 'enter a valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                ),
                mySizeBox(),
                Container(
                  height: 75,
                  width: 500,
                  child: TextFormField(
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return '*Required';
                      }else if(value.length<8){
                        return 'Password must be 8 letter long';
                      }/*else if(!isPassValid(value)){
                        return 'Enter a strong password';
                      }*/
                      return null;
                    },
                    controller: passController,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(onPressed: (){
                          isHide=!isHide;
                          setState(() {

                          });
                        },icon: Icon(isHide?Icons.visibility:Icons.visibility_off),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    obscureText: isHide,
                  ),
                ),
                mySizeBox(),
                BlocListener<SignupBloc,SignupState>(
                  listener: (context, state){
                    if(state is SErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                    }else if(state is SLoadedState){
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    child: ElevatedButton(onPressed: ()  {
                      if(_FORM_KEY.currentState!.validate()){
                        context.read<SignupBloc>().add(SignEvent(
                            name: nameController.text.toString(),
                            mobile_number:mobController.text,
                            email:  emailController.text.toString(),
                            password:  passController.text.toString()));
                      }


                    }, child: Text('Sign Up',style: TextStyle(fontSize: 25,color: Colors.white),),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.blue.shade500,),),
                  ),),
                mySizeBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account,',style: TextStyle(fontSize: 20,color: Colors.purple.shade600),),
                    InkWell(onTap: (){
                      Navigator.pop(context);
                    },
                        child: Text(' Login now',style: TextStyle(fontSize: 21,color: Colors.blue),)),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
