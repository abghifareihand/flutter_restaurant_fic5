import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/detail_restaurant/detail_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/restaurant_datasource.dart';
import 'package:flutter_restaurant_fic5/presentation/widgets/custom_transition_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllProductBloc(RestaurantDataSource()),
        ),
        BlocProvider(
          create: (context) => DetailRestaurantBloc(RestaurantDataSource()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff5C40CC)),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
