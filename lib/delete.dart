import 'package:cart_app/edit.dart';
import 'package:cart_app/model/productModel.dart';
import 'package:cart_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class delete extends StatefulWidget {
  const delete({super.key});

  @override
  State<delete> createState() => _UpdateState();
}

class _UpdateState extends State<delete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete"),
      ),
      body: FutureBuilder(
        future: Api
            .getPro(), //data from the getpro() func will send to this future builder and will be stored as snapshot
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //the data will be stored inside snapshot
          if (!snapshot.hasData) {
            return Center(
              //returns to builder (the comments are basic as im still learning bear with me)
              child: const CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;

            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.storage),
                  title: Text('${pdata[index].name}'),
                  subtitle: Text(pdata[index].desc),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await Api.del(pdata[index].id);
                      pdata.removeAt(index);
                      setState(() {
                        
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
