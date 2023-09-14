// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant_fic5/data/models/response/add_product_response_model.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/restaurant_datasource.dart';

part 'detail_restaurant_bloc.freezed.dart';
part 'detail_restaurant_event.dart';
part 'detail_restaurant_state.dart';

class DetailRestaurantBloc extends Bloc<DetailRestaurantEvent, DetailRestaurantState> {
  final RestaurantDataSource dataSource;
  DetailRestaurantBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getById(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
