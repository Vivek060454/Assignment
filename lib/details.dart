
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final produt;
  Details(this.produt, {Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('User Information:   '+ widget.produt['usertitle'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
SizedBox(
  height: 20,
),
            Align(
                alignment: Alignment.topLeft,
                child: Text('User Details:   '+widget.produt['userdescription'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),)),

            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Personal Information:   '+ widget.produt['title'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Personal Details:   '+ widget.produt['description'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text('First Name:   '+ widget.produt['firstname'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Last Name:   '+ widget.produt['lastname'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 20,
            ),
        Align(
            alignment: Alignment.topLeft,
            child: Text('Email:   '+ widget.produt['email'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text('Gender:   '+ widget.produt['gender'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text('Education:   '+ widget.produt['education'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),










          ],
        ),
      ),
    );
  }
}
