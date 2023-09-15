part of 'add_restaurant_bloc.dart';

@freezed
class AddRestaurantState with _$AddRestaurantState {
  const factory AddRestaurantState.initial() = _Initial;
    const factory AddRestaurantState.loading() = _Loading;
  const factory AddRestaurantState.loaded(AddProductResponseModel data) = _Loaded;
  const factory AddRestaurantState.error(String message) = _Error;
}
