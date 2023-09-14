part of 'detail_restaurant_bloc.dart';

@freezed
class DetailRestaurantEvent with _$DetailRestaurantEvent {
  const factory DetailRestaurantEvent.started() = _Started;
  const factory DetailRestaurantEvent.get(int id) = _Get;
}