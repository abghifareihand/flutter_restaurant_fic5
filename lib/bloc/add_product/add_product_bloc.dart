// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant_fic5/data/models/request/add_product_request_model.dart';
import 'package:flutter_restaurant_fic5/data/models/response/add_product_response_model.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/restaurant_datasource.dart';

part 'add_product_bloc.freezed.dart';
part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final RestaurantDataSource dataSource;
  AddProductBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Add>((event, emit) async {
     emit(const _Loading());
      final result = await dataSource.addProduct(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
