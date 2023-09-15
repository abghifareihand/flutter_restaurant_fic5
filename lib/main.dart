import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/add_restaurant/add_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/detail_restaurant/detail_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/gmap_restaurant/gmap_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/login/login_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/register/register_bloc.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/auth_datasource.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/gmap_datasource.dart';
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
        // BlocProvider(
        //   create: (context) => GetAllProductBloc(RestaurantDataSource()),
        // ),
        BlocProvider(
          create: (context) => GetAllRestaurantBloc(RestaurantDataSource()),
        ),
        BlocProvider(
          create: (context) => DetailRestaurantBloc(RestaurantDataSource()),
        ),
        BlocProvider(
          create: (context) => GmapRestaurantBloc(GmapDataSource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => AddRestaurantBloc(RestaurantDataSource()),
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
