import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_event.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/product_model.dart';
import '../../../../domain/api_data/api.dart';
import '../../../../domain/api_data/api_urls.dart';

class ProductBloc extends Bloc<ProductEvents,ProductState>{
  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}):super(PInitState()){
    on<ProductsE>((event, emit) async {
      emit( PLoadingState());
      try{
        var mData= await apiHelper.postApi(url: GetApiUrl.PRODECT_URL,isHeader: true);
        var rawData=DataModel.fromJson(mData);
        emit(PLoadedState(dataModel: rawData));
      }catch(e){
        emit(PErrorState(msg: (e.toString())));
      }
    });
  }
}