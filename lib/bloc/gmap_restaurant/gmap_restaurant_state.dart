part of 'gmap_restaurant_bloc.dart';

@freezed
class GmapRestaurantState with _$GmapRestaurantState {
  const factory GmapRestaurantState.initial() = _Initial;
    const factory GmapRestaurantState.loading() = _Loading;
  const factory GmapRestaurantState.loaded(GmapModel model) = _Loaded;
  const factory GmapRestaurantState.error(String message) = _Error;
}
