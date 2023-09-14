import 'package:flutter/material.dart';
import 'package:flutter_restaurant_fic5/presentation/widgets/custom_transition_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff5C40CC)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
