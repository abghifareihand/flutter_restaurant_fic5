import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/response/add_product_response_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant data;
  const RestaurantCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/detail-restaurant/${data.id}'),
      child: Card(
        child: ListTile(
          title: Text('${data.attributes.name} ${data.attributes.userId}'),
          subtitle: Text(data.attributes.description),
          leading: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  data.attributes.photo,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
