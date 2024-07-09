import 'dart:convert';
import 'dart:io';
import 'package:get_di_sample/model/model.dart';
import 'package:http/http.dart' as http;

class SecondService {
  Future<Model> fetchData() async {
    String url = "https://jsonplaceholder.typicode.com/todos/1";
    dynamic res;
    try {
      res = await http.get(Uri.parse(url));
    } catch (e) {
      if (e is SocketException) throw Exception("No internet connection");
    }
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final Model result = Model.fromJson(json);
      return result;
    } else if (res.statusCode >= 400 && res.statusCode < 500) {
      throw Exception("Error fetching second");
    } else if (res.statusCode >= 500 && res.statusCode < 600) {
      throw Exception("Server error");
    } else {
      throw Exception("Error occurred, please try again later");
    }
  }
}
