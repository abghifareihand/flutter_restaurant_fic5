part of 'get_all_restaurant_bloc.dart';

@freezed
class GetAllRestaurantState with _$GetAllRestaurantState {
  const factory GetAllRestaurantState.initial() = _Initial;
  const factory GetAllRestaurantState.loading() = _Loading;
  const factory GetAllRestaurantState.loaded(ProductsResponseModel data) = _Loaded;
  const factory GetAllRestaurantState.error() = _Error;
}
