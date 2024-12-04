import 'package:flutter/material.dart';
import 'cart/cart_page.dart';
import 'home_page.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> pages=[
    HomePage(),
    Center(child: Text('Favorite'),),
    MyCartPage(),
    Center(child: Text('Profile'),),
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.orange,

        onPressed: (){},
        child: Icon(Icons.home_filled,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              setState(() {
                selectedIndex=0;
              });
            }, icon: Icon(Icons.menu,size: 35,color: Colors.grey,),),
            IconButton(onPressed: (){
              setState(() {
                selectedIndex=1;
              });
            }, icon: Icon(Icons.favorite_border,size: 35,color: Colors.grey),),
            IconButton(onPressed: (){
              setState(() {
                selectedIndex=2;
              });
            }, icon: Icon(Icons.shopping_cart_rounded,size: 35,color: Colors.grey,),),
            IconButton(onPressed: (){
              setState(() {
                selectedIndex=3;
              });
            }, icon: Icon(Icons.account_circle,size: 35,color: Colors.grey,),),
          ],),
        elevation: 11,
        notchMargin: 5,
        shadowColor: Colors.grey,
        shape: CircularNotchedRectangle(),
        surfaceTintColor: Colors.white,
      ),
    );
  }
}
