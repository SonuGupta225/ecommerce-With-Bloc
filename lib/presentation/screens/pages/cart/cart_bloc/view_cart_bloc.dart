import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/cart/cart_bloc/view_cart_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/cart/cart_bloc/view_cart_state.dart';
import '../../../../../data/model/view_cart_model.dart';
import '../../../../../domain/api_data/api.dart';
import '../../../../../domain/api_data/api_urls.dart';
class ViewCartBloc extends Bloc<ViewCtEvent, ViewCartState> {
  ApiHelper apiHelper;
  ViewCartBloc({required this.apiHelper}) : super(ViewCartInitialState()) {
    on<ViewCartEvent>((event, emit) async {
      emit(ViewCartLoadingState());

      try{
        dynamic mData=await apiHelper.getApi(url: GetApiUrl.VIEW_CART_URL,);
        List<ViewCartModel> mList=[];
        for(Map<String,dynamic>each in mData['data']){
          mList.add(ViewCartModel.fromJson(each));
        }
        var data=ViewCartModel.fromJson(mData);
        emit(ViewCartLoadedState(viewCartData: mList));
      }catch(e){
        emit(ViewCartErrorState(msg: e.toString()));
      }
    });
  }
}
