import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/api_data/api_urls.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/api_data/api.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  ApiHelper apiHelper;
  CheckoutBloc({required this.apiHelper}) : super(CheckoutInitialState()) {
    on<PlaceOrderEvent>((event, emit) async {
      emit(CheckoutLoadingState());

      try{
        var mData = await apiHelper.postApi(url: GetApiUrl.PLACE_ORDER_URL, isHeader: true);

        if(mData['status']){
          emit(CheckoutSuccessState());
        } else {
          emit(CheckoutFailureState(errorMsg: "${mData['message']}"));
        }

      } catch(e){
        emit(CheckoutFailureState(errorMsg: e.toString()));
      }
    });
  }
}
