// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_restaurant_fic5/data/models/request/login_request_model.dart';
import 'package:flutter_restaurant_fic5/data/models/response/auth_response_model.dart';
import 'package:flutter_restaurant_fic5/data/remote_datasources/auth_datasource.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDataSource dataSource;
  LoginBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.login(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
