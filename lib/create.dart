import 'package:cart_app/services/api.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var nameCon = TextEditingController();
  var priceCon = TextEditingController();
  var descCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameCon,
            decoration: const InputDecoration(hintText: "Enter name"),
          ),
          TextField(
            controller: priceCon,
            decoration: const InputDecoration(hintText: "Enter name"),
          ),
          TextField(
            controller: descCon,
            decoration: const InputDecoration(hintText: "Enter name"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                var data = {
                  "pname": nameCon.text,
                  "pprice": priceCon.text,
                  "pdesc": descCon.text
                };
                Api.create(data);//to call our aoi class's create function and pass the data we got from our textfields 
              },
              child: Text("Create")),
        ],
      ),
    );
  }
}
