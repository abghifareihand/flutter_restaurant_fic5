// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant_fic5/data/models/gmap_model.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/gmap_datasource.dart';

part 'gmap_bloc.freezed.dart';
part 'gmap_event.dart';
part 'gmap_state.dart';

class GmapBloc extends Bloc<GmapEvent, GmapState> {
  final GmapDataSource dataSource;
  GmapBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_GetCurrentLocation>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getCurrentPosition();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });

    on<_GetSelectPosition>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getPosition(
        lat: event.lat,
        long: event.long,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
