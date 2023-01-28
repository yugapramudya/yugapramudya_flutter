import 'dart:convert';

import 'package:dio/dio.dart';

class Services {
  String urlAPI = 'https://belajar-api.renaldiyulvianda.my.id/api';

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        '$urlAPI/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.toString());
      } else {
        return response.statusCode;
      }
    } catch (e) {
      print(e);
      return 403;
    }
  }

  Future<dynamic> register({
    required String name,
    required String email,
    required String password,
    required String secondPassword,
  }) async {
    try {
      var response = await Dio().post(
        '$urlAPI/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'c_password': secondPassword,
        },
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.toString());
      } else {
        return response.statusCode;
      }
    } catch (e) {
      print(e);
      return 403;
    }
  }

  Future<dynamic> getData({
    required String token,
  }) async {
    try {
      var response = await Dio().get(
        '$urlAPI/master/buku',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );

      return jsonDecode(response.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> delete({
    required String token,
    required String id,
  }) async {
    try {
      var response = await Dio().delete(
        '$urlAPI/master/buku/hapus/$id',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> addData({
    required String judul,
    required String penerbit,
    required String edisi,
    required String token,
  }) async {
    try {
      var response = await Dio().post(
        '$urlAPI/master/buku/tambah',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
        data: {
          'judul': judul,
          'edisi_ke': edisi,
          'penerbit_id': penerbit,
        },
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> updateData({
    required String judul,
    required String penerbit,
    required String edisi,
    required String token,
    required String id,
  }) async {
    try {
      var response = await Dio().patch(
        '$urlAPI/master/buku/ubah/$id',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
        data: {
          'judul': judul,
          'edisi_ke': edisi,
          'penerbit_id': penerbit,
        },
      );
      return response;
    } catch (e) {
      print(e);
    }
  }
}
