import 'package:ecommerce_app/presentation/screens/pages/category_bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/category_model.dart';
import '../../../../domain/api_data/api.dart';
import '../../../../domain/api_data/api_urls.dart';
import 'category_events.dart';

class CategoryBloc extends Bloc<CategoryEvents,CategoryState>{
  ApiHelper apiHelper;
  CategoryBloc({required this.apiHelper}):super(CInitState()){
    on<CategoryE>((event, emit) async {
      emit( CLoadingState());
      try{
        dynamic data= await apiHelper.getApi(url: GetApiUrl.CATEGORY_URL,);
        List<CategoryModel>mCategory=[];
        for(Map<String,dynamic> each in data['data']){
          mCategory.add(CategoryModel.fromJson(each));
        }
        emit(CLoadedState(data: mCategory));
      }catch(e){
        emit(CErrorState(msg: (e.toString())));
      }
    });
  }
}