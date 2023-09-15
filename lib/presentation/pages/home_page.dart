import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/presentation/widgets/restaurant_card.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  //static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetAllRestaurantBloc>().add(const GetAllRestaurantEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List Restaurant'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) {
          if (value == 1) {
            context.push('/restaurant');
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
