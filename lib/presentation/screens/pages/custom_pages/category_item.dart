
import 'package:ecommerce_app/domain/ui_data.dart';
import 'package:ecommerce_app/presentation/screens/pages/category_bloc/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../category_bloc/category_bloc.dart';
class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc,CategoryState>(
        builder: (_,state){
      if(state is CLoadingState){
        return Center(child: CircularProgressIndicator(),);
      }else if(state is CErrorState){
        return Center(child: Text(state.msg),);
      }else if(state is CLoadedState){

        return  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.data.length,
            itemBuilder: (BuildContext c, index){
              var mData=state.data[index];
              return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(border: Border.all(),shape: BoxShape.circle),
                      child: ClipOval(
                          child: Image.network(
                            UiData.listDetail[index],
                            fit: BoxFit.fill,
                          ))),
                ),
                Text(
                  '${mData.name}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            );

            });
      }
      return Container();
      }

    ));
  }
}

