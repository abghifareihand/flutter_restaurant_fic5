import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant_fic5/common/constans.dart';
import 'package:flutter_restaurant_fic5/data/local_datasources/local_datasource.dart';
import 'package:flutter_restaurant_fic5/data/models/request/add_product_request_model.dart';
import 'package:flutter_restaurant_fic5/data/models/response/add_product_response_model.dart';
import 'package:flutter_restaurant_fic5/data/models/response/products_response_model.dart';
import 'package:http/http.dart' as http;

class RestaurantDataSource {
  Future<Either<String, ProductsResponseModel>> getAll() async {
    final response = await http.get(
      Uri.parse('${Constans.baseUrl}/api/restaurants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        ProductsResponseModel.fromJson(jsonDecode(response.body)),
      );
    } else {
      return const Left('API ERROR');
    }
  }

  Future<Either<String, AddProductResponseModel>> addProduct(
      AddProductRequestModel model) async {
    final token = await LocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('${Constans.baseUrl}/api/restaurants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return Right(
        AddProductResponseModel.fromJson(jsonDecode(response.body)),
      );
    } else {
      return const Left('API ERROR');
    }
  }

  Future<Either<String, AddProductResponseModel>> getById(int id) async {
    final response = await http.get(
      Uri.parse('${Constans.baseUrl}/api/restaurants/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        AddProductResponseModel.fromJson(jsonDecode(response.body)),
      );
    } else {
      return const Left('API ERROR');
    }
  }
}
