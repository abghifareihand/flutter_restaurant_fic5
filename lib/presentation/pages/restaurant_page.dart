import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_restaurant_fic5/data/local_datasources/local_datasource.dart';
import 'package:flutter_restaurant_fic5/presentation/widgets/restaurant_card.dart';
import 'package:go_router/go_router.dart';

class RestaurantPage extends StatefulWidget {
  //static const routeName = '/restaurant';
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  void initState() {
    context
        .read<GetAllProductBloc>()
        .add(const GetAllProductEvent.getByUserId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Restaurant'),
        actions: [
          IconButton(
            onPressed: () async {
              context.go('/login');
              await LocalDataSource().removeAuthData();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: BlocBuilder<GetAllProductBloc, GetAllProductState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: () => const Text('No Data'),
                loaded: (data) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return RestaurantCard(data: data.data[index]);
                    },
                    itemCount: data.data.length,
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/add-restaurant');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) {
            context.push('/home');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'All Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Account',
          ),
        ],
      ),
    );
  }
}
