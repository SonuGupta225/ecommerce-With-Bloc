
import '../../../../../data/model/view_cart_model.dart';

abstract class ViewCartState {}
class ViewCartInitialState extends ViewCartState {}
class ViewCartLoadingState extends ViewCartState {}
class ViewCartLoadedState extends ViewCartState {
  List<ViewCartModel> viewCartData;
  ViewCartLoadedState({required this.viewCartData});
}
class ViewCartErrorState extends ViewCartState {
  String msg;
  ViewCartErrorState({required this.msg});
}

