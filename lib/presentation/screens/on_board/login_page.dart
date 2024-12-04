import 'package:ecommerce_app/domain/api_data/api.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_event.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_state.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_bloc.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/home_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/navigation_page.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool isHide = true;
  final _FORM_KEY=GlobalKey<FormState>();
  bool isEmailValid(String email){
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _FORM_KEY,
      child: Scaffold(
          body: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('E-Commerce',
                          style: TextStyle(
                            fontSize: 30,
                          )),
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
                              return '*required';
                            }
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
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                            if (state is ErrorState) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(state.msg)));
                          } else if (state is LoadedState) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationPage(),
                                ));
                          }
                        },
                        child: Container(
                          width: 500,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: ()  {
                                if(_FORM_KEY.currentState!.validate()){
                                  context.read<LoginBloc>().add(LoginEvent(email:emailController.text.toString(), password:passController.text.toString()));
                                }

                              },
                              child: Text(
                                'Login',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.blue.shade500,
                              )),
                        ),
                      ),
                      mySizeBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                fontSize: 20, color: Colors.purple.shade600),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                          create: (context) =>
                                              SignupBloc(apiHelper: ApiHelper()),
                                          child: SignUp()),
                                    ));
                              },
                              child: Text(
                                'Sign up',
                                style:
                                    TextStyle(fontSize: 21, color: Colors.blue),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),),
    );
  }
}
