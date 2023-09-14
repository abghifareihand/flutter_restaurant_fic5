import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  static const routeName = '/restaurant';
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Restaurant'),
      ),
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
