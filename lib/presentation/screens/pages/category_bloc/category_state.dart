import '../../../../data/model/category_model.dart';

abstract class CategoryState{}
class CInitState extends CategoryState{}
class CLoadingState extends CategoryState{}
class CLoadedState extends CategoryState{
  List<CategoryModel> data;
  CLoadedState({required this.data});
}
class CErrorState extends CategoryState{
  String msg;
  CErrorState({required this.msg});}