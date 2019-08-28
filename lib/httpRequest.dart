import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Map> getMovie() async {
  final String url =
      'http://api.themoviedb.org/3/discover/movie?api_key=fee8696b379531748299a02d138b8391';

  http.Response response = await http.get(url);
  return json.decode(response.body);
}
