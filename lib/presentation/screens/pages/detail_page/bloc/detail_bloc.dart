import 'package:ecommerce_app/presentation/screens/pages/detail_page/bloc/detail_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/detail_page/bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/api_data/api.dart';
import '../../../../../domain/api_data/api_urls.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState>{
  ApiHelper apiHelper;
  DetailBloc({required this.apiHelper}) : super(DetailInitialState()){

    on<AddToCartEvent>((event, emit) async{
      emit(DetailLoadingState());
      try{
        var mData = await apiHelper.postApi(url: GetApiUrl.ADD_TO_CART_URL, isHeader: true, mapData: {
          "product_id":event.productId,
          "quantity":event.qty
        });

        print("res add to cart : $mData");

        if(mData['status']=="true"){
          emit(DetailLoadedState());
        } else {
          emit(DetailErrorState(errorMsg: mData['message']));
        }
      } catch(e){
        emit(DetailErrorState(errorMsg: e.toString()));
      }

    });

  }
}