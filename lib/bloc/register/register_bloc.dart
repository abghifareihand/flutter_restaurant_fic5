// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant_fic5/data/models/request/register_request_model.dart';
import 'package:flutter_restaurant_fic5/data/models/response/auth_response_model.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/auth_datasource.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDataSource dataSource;
  RegisterBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.register(event.model);
      result.fold(
        (l) => emit(const _Error()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
