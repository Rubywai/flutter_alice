import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Alice _alice;
  Dio _dio;
  ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _alice = Alice(showNotification: true);
    _dio = Dio();
    _apiService = ApiService(this._alice, this._dio);
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _alice.getNavigatorKey(),
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Get Data'),
              onPressed: () {
                _apiService.getApiService();
              },
            ),
            SizedBox(width: 20,),
            RaisedButton(
              child: Text('Go Alice Inceptor'),
              onPressed: () {
                _alice.showInspector();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
