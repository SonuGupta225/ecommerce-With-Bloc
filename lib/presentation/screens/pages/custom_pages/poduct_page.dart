
import 'package:ecommerce_app/data/model/product_model.dart';
import 'package:ecommerce_app/presentation/screens/pages/detail_page/item_detail_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  List<ProductModel> mData;
  int index;
   ProductPage({required this.mData,required this.index});

  @override

  Widget build(BuildContext context) {
    var data=mData[index];
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailPage(mProductId: int.parse(data.id!), imgUrl: '${data.image}', pName: '${data.name}', pPrice: '${data.price}'),));
        },
        child: Container(
          width: 300,
          height: 300,
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.grey.shade300,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Image.network('${data.image}',),
                    Text('${data.name}',textAlign: TextAlign.start,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${data.price}'),
                        Row(children: List.generate(4, (index){
                          if(index==3){
                            return Container(
                              width: 20,height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                  border: Border.all()
                              ),
                              child: Center(child: Text('+2'),),
                            );
                          }else{
                            return Container(
                              width: 20,height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                  border: Border.all()
                              ),
                            );
                          }
                        })
                          ,)
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 48,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(21),
                        bottomLeft: Radius.circular(22)),
                    color: Colors.orange.shade700,
                  ),

                  child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),

            ],
          ),
        ),
      )

    );
  }
}