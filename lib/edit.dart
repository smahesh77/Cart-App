import 'package:cart_app/model/productModel.dart';
import 'package:cart_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditScreen extends StatefulWidget {
  final Product data; // product data which needs to be edited
  const EditScreen(
      {super.key,
      required this.data}); // data can be accessed later using widget.data

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameCon = TextEditingController();
  var priceCon = TextEditingController();
  var descCon = TextEditingController();

  @override
  void initState() {
    //to set the deets of previous data when user opens when thewidget is created
    super.initState();
    nameCon.text = widget.data.name.toString();
    priceCon.text = widget.data.price.toString();
    descCon.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameCon,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextField(
            controller: descCon,
            decoration: InputDecoration(hintText: "desc"),
          ),
          TextField(
            controller: priceCon,
            decoration: InputDecoration(hintText: "Price"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Api.update(widget.data.id, {
                  'id': widget.data.id,
                  "pname": nameCon.text,
                  "pprice": priceCon.text,
                  "pdesc": descCon.text
                });
                Navigator.pop(context);
              },
              child: Text("Update"))
        ],
      ),
    );
  }
}
