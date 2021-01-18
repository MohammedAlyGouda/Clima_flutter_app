import 'package:http/http.dart';
import 'dart:convert';

class NetwarkHelper {
  NetwarkHelper(this.URL);
  final String URL;

  Future getData() async {
    Response response = await get(URL);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
