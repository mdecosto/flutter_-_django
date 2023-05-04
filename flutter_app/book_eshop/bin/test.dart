// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

main() async {
  var response = await http.get(Uri.parse('http://127.0.0.1:8000/api_core/a'));
  print(response.body);
}
