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
        var data = jsonDecode(response.body.toString());
        print("Flutter:" + data);
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
      print("test");
      data['products'].forEach((value) => {
            print(value['pname']),
            //will go through each product recevied from server and it will be stored in value
            products.add(
              Product(
                  name: value['pname'].toString(),
                  price: value['pprice'].toString(),
                  desc: value['pdesc'].toString(),
                  id: value['id'].toString()),
            ), //creats a product object and stores it to the list
            print(products[0].name)
          });
      print(products);
      return products;
    } else {
      return [];
    }
  }

  static update(id, data) async {
    final put = baseUrl + "put/" + id;
    print(put);

    final response = await http.post(Uri.parse(put), body: data);
    if (response.statusCode == 200) {
      print("updated ${jsonDecode(response.body)}");
    } else {
      print("failed to update");
    }
  }

  static del(id) async {
    final del = baseUrl + "del/" + id;

    final res = await http.post((Uri.parse(del)));

    if (res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print("failed to delete");
    }
  }
}
