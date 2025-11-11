import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5)
  ));

  Future<List<dynamic>> getUsers() async{
  try{
    final response = await _dio.get('/users');
    return response.data;
  } on DioException catch(e){
    print('Error: ${e.message}');
    return [];
  }
}
}

