import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/detail_restaurant/detail_restaurant_bloc.dart';
import 'package:flutter_restaurant_fic5/bloc/gmap_restaurant/gmap_restaurant_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailRestaurantPage extends StatefulWidget {
  //static const routeName = '/detail';
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
    context.read<GmapRestaurantBloc>().add(const GmapRestaurantEvent.getCurrentLocation());
    super.initState();
  }

  final Set<Marker> markers = {};
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  LatLng? position;

  void createMarker(double lat, double lng, String address) {
    final marker = Marker(
      markerId: const MarkerId('currentPosition'),
      infoWindow: InfoWindow(title: address),
      position: LatLng(lat, lng),
      icon: markerIcon,
    );

    markers.add(marker);
  }

  LatLng? positionDestination;

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
              final lat = double.parse(model.data.attributes.latitude);
              final lng = double.parse(model.data.attributes.longitude);
              positionDestination = LatLng(lat, lng);
              position = LatLng(lat, lng);
              createMarker(lat, lng, model.data.attributes.address);
              return ListView(
                children: [
                  Image.network(
                    model.data.attributes.photo,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fill,
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
                  Text(
                      'LatLong : ${model.data.attributes.latitude}, ${model.data.attributes.longitude},'),
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: markers,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          lat,
                          lng,
                        ),
                        zoom: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
