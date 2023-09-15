part of 'gmap_restaurant_bloc.dart';

@freezed
class GmapRestaurantEvent with _$GmapRestaurantEvent {
  const factory GmapRestaurantEvent.started() = _Started;
  const factory GmapRestaurantEvent.getCurrentLocation() = _GetCurrentLocation;
  const factory GmapRestaurantEvent.getSelectPosition(double lat, double long) = _GetSelectPosition;
}
