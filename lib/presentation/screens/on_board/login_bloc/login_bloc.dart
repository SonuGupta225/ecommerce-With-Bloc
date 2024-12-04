import 'package:ecommerce_app/domain/api_data/api_urls.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_event.dart';
import 'package:ecommerce_app/presentation/screens/on_board/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/app_pref.dart';
import '../../../../domain/api_data/api.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{
  ApiHelper apiHelper;
  LoginBloc({required this.apiHelper}):super(InitState()){
    on<LoginEvent>((event, emit) async {
      emit(LoadingState());
      try{
        var mData= await apiHelper.postApi(url: GetApiUrl.LOGIN_URL,mapData:{"email":event.email, "password":event.password},);
        var loginData=JsonResponse(status: mData['status'], message: mData['message'], token: mData['tokan']);
        if(loginData.status!){
          AppPrefs().setToken(loginData.token!);
          emit(LoadedState());
        }else{
          emit(ErrorState(msg: '${loginData.message}'));
        }

      }catch(e){
        emit(ErrorState(msg: (e.toString())));
      }
    });
  }
}