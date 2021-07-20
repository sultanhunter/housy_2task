import 'package:dio/dio.dart';

Dio dio = Dio();

Future<List> getData() async {
  final String pathUrl = 'https://hoblist.com/movieList';

  dynamic data = {
    "category": "movies",
    "language": "hindi",
    "genre": "all",
    "sort": "voting",
  };

  var response = await dio.post(pathUrl,
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}));

  return response.data['result'] as List;
}
