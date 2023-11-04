import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class idpagetwo extends StatefulWidget {
  idpagetwo({Key? key,required this.id}) : super(key: key);
  String id;
  @override
  State<idpagetwo> createState() => _idpagetwoState();
}

class _idpagetwoState extends State<idpagetwo> {
  Future<dynamic> getData()async{
    String url = "https://jsonplaceholder.typicode.com/users";
    Response response = await get(Uri.parse(url));
    return jsonDecode(response.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(future:getData(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return CircularProgressIndicator();
                }else if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data['id']),
                      Text(snapshot.data['name']),
                      Text(snapshot.data['username']),
                      Text(snapshot.data['email']),


                    ],

                  );
                }else{
                  return Center(child: Text('no data'),);

                }
              },)
          ],


        ),
      ),

    );
  }
}
