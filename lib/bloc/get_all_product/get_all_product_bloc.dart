// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant_fic5/data/models/response/products_response_model.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/restaurant_datasource.dart';

part 'get_all_product_bloc.freezed.dart';
part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final RestaurantDataSource dataSource;
  GetAllProductBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getAll();
      result.fold(
        (l) => emit(const _Error()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
