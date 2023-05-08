import 'dart:convert';

import 'package:cart_app/create.dart';
import 'package:cart_app/model/productModel.dart';
import 'package:http/http.dart' as http;

final baseUrl = "http://192.168.29.105:3000/api/";
final Create = baseUrl + "add";
final get = baseUrl + "get";

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

  //to fetch data from db
  static getPro() async {
    List<Product> products =
        []; //this will create a array of product class objects
    final response = await http.get(Uri.parse(get));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      data['products'].forEach((value) => {
            //will go throw each product recevied from server and it will be stored in value
            products.add(Product(
                name: value['pname'],
                price: value['pprice'],
                desc: value[
                    'pdesc'])) //creats a product object and stores it to the list
          });
      print(products);
      return products;
    } else {
      return [];
    }
  }
}
