import 'package:flutter/material.dart';
import 'package:flutter_restaurant_fic5/presentation/pages/restaurant_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Text('No Data'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) {
          if (value == 1) {
            context.push(RestaurantPage.routeName);
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
