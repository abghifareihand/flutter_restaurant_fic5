import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/detail_restaurant/detail_restaurant_bloc.dart';

class DetailRestaurantPage extends StatefulWidget {
  static const routeName = '/detail';
  final int id;
  const DetailRestaurantPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  void initState() {
    context
        .read<DetailRestaurantBloc>()
        .add(DetailRestaurantEvent.get(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
      ),
      body: BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Text('No Detail'),
            loaded: (model) {
              return ListView(
                children: [
                  Hero(
                    tag: model.data.attributes.photo,
                    child: Image.network(model.data.attributes.photo),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(model.data.attributes.name),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(model.data.attributes.description),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(model.data.attributes.address),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
