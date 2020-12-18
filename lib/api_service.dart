import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Alice _alice;
  final Dio _dio;

  ApiService(this._alice, this._dio) {
    _dio.interceptors.add(_alice.getDioInterceptor());
  }

  void getApiService() async {
    _dio.get('http://www.google.com').then((value) => print(value)).catchError((e){});
    _dio.get('http://www.xyzabcd.com').then((value) => print(value)).catchError((e){});
    _dio.post('http://www.jsonplaceholder.com').then((value) => print(value)).catchError((e){});
    _dio.put('https://jsonplaceholder.typicode.com/posts').then((value) => print(value)).catchError((e){});
    _dio.delete('http://www.google.com').then((value) => print(value)).catchError((e){});
  }
}
