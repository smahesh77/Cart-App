import 'dart:convert';

import 'package:cart_app/create.dart';
import 'package:http/http.dart' as http;

final baseUrl = "http://192.168.29.105:3000/api/";
final Create = baseUrl + "add";

class Api {
  static create(Map pdata /* to store product data */) async {
    try {
      print(pdata);
      var pbody = {
        "pname": pdata['pname'],
        "pprice": pdata['pprice'],
        "pdesc": pdata['pdesc']
      };
      var response = await http.post(Uri.parse(Create),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(pbody));

      if (response.statusCode == 200) {
        print("response recived");
        var data = jsonDecode(response.body.toString());
        print(data);
      }
    } catch (err) {
      print(err);
    }
  }
}
