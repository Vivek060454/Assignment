import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'adduser.dart';
import 'details.dart';
import 'edit.dart';
import 'model.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List? listfact;

  fetchdata() async{
    var url =
  Uri.parse("https://crudcrud.com/api/a727bcb21052439ebc1ea948b5e087d0/unicorns/");
    var response = await http.get(url);
    print(response.statusCode);
  if(response.statusCode==200){
   print(response.body);
    setState(() {
      listfact= json.decode(response.body);
    });
  }
  }

  deleteUser(id) async{
    print(id);
    var url =
    Uri.parse("https://crudcrud.com/api/a727bcb21052439ebc1ea948b5e087d0/unicorns/"+id);
    var response = await http.delete(url);
    print(response.statusCode);
    Fluttertoast.showToast(msg: "Deleted");
    fetchdata();
    if(response.statusCode==200){
      print(response.body);
      setState(() {
        listfact= json.decode(response.body);

      });
    }
  }
    @override
    void initState() {
      fetchdata();
      // TODO: implement initState
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder:(context, ThemeModel themeNotifier, child){
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(themeNotifier.isDark
                        ? Icons.light_mode
                        : Icons.wb_sunny),
                    onPressed: () {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Adduser()));
                    },
                    child: Icon(Icons.add)),
              )
            ],
          ),
          body: listfact==null?Center(child: CircularProgressIndicator()):ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index){
              final  produt = listfact![index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black26),
                      ),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(produt)));
                        },
                        title: Text('Name :  '+ produt['firstname'].toString()+"  "+ produt['lastname'].toString()),
                        subtitle: Column(
                          children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('Email :  '+produt['email'].toString())),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: (){

                                        setState(() {
                                          deleteUser(produt['_id']);
                                        });
                                      },
                                      child: Icon(Icons.delete)),
                                  SizedBox(
                                      width:30
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit(produt)))  ;

                                      },
                                      child: Icon(Icons.edit)),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
              //
            },

            itemCount:listfact==null? 0:listfact!.length,
          ),
        );
      },

    );
  }
}
