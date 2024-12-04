
import '../../../../data/model/product_model.dart';

abstract class ProductState{}
class PInitState extends ProductState{}
class PLoadingState extends ProductState{}
class PLoadedState extends ProductState{
 DataModel dataModel;
  PLoadedState({required this.dataModel});
}
class PErrorState extends ProductState{
  String msg;
  PErrorState({required this.msg});}