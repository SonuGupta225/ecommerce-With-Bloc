
import 'package:ecommerce_app/domain/api_data/api.dart';
import 'package:ecommerce_app/presentation/screens/pages/cart/bloc/checkout_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/cart/cart_bloc/view_cart_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/category_bloc/category_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/detail_page/bloc/detail_bloc.dart';
import 'package:ecommerce_app/presentation/screens/pages/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/presentation/screens/spladh_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
   BlocProvider(create: (context) => CategoryBloc(apiHelper: ApiHelper()),),
   BlocProvider(create: (context) => ProductBloc(apiHelper: ApiHelper()),),
   BlocProvider(create: (context) => DetailBloc(apiHelper: ApiHelper()),),
   BlocProvider(create: (context) => ViewCartBloc(apiHelper: ApiHelper()),),
   BlocProvider(create: (context) => CheckoutBloc(apiHelper: ApiHelper()),),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashPage(),
    );
  }
}
