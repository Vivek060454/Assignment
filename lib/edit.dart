import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
class Edit extends StatefulWidget {
  final produt;
  Edit(this.produt, {Key? key}) : super(key: key);
  @override
  EditState createState() {
    return EditState();
  }
}
class EditState extends State<Edit > {
  var _genderRadioBtnVal='';
  var education = null;
  final _formKey = GlobalKey<FormState>();
  var userinformation="";
  var userdescription="";
  var firstname="";
  var lastname="";
  var email="";
  var title="";
  var description="";
  final educations = [
    'Primary School','High School','Graduate Degree','Postgraduate Degree','Master Degree','Ph.D. Degree'
  ];
  final TextEditingController    _userinformationController = new TextEditingController();
  final TextEditingController  _userdescriptionController = new TextEditingController();
  final TextEditingController  _firstnameController = new TextEditingController();
  final TextEditingController  _lastnameController = new TextEditingController();
  final TextEditingController    _emailController = new TextEditingController();
  final TextEditingController  _genderController = new TextEditingController();
  // final TextEditingController   _educationController = new TextEditingController();
  final TextEditingController  _tiltleController = new TextEditingController();
  final TextEditingController   _descriptionController = new TextEditingController();
  editUser() async {
    Map<String, String> body = {
      'usertitle': userinformation,
      'userdescription': userdescription,
      'firstname':firstname,
      'lastname':lastname,
      'email': email,
      'gender':_genderRadioBtnVal,
      'education':education,
      'title':title,
      'description':description
    };
    print(body);
    if(education==null){
      Fluttertoast.showToast(msg: "Select Education");
    }
    if(_genderRadioBtnVal==null){
      Fluttertoast.showToast(msg: "Select Gender");
    }
    final http.Response response = await http.put(
      Uri.parse('https://crudcrud.com/api/a727bcb21052439ebc1ea948b5e087d0/unicorns/${widget.produt['_id']}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),

    );
    print(response.statusCode);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
  }

@override
  void initState() {
print('Init'+widget.produt.toString());
  _userinformationController.text=widget.produt['usertitle']??'';
  _userdescriptionController.text=widget.produt['userdescription']??'';
  _firstnameController.text=widget.produt['firstname']??'';
  _lastnameController.text=widget.produt['lastname']??'';
  _emailController.text=widget.produt['email']??'';
  _genderController.text=widget.produt['gender']??'';
_tiltleController.text=widget.produt['title']??'';
  _descriptionController.text=widget.produt['description']??'';

  super.initState();
  }
  @override
  Widget build(BuildContext context) {

    @override
    void dispose(){

      _userinformationController.dispose();
      _userdescriptionController.dispose();
      _firstnameController.dispose();
      _lastnameController.dispose();
      _emailController.dispose();
      _genderController.dispose();
      //_educationController.dispose();
      _tiltleController.dispose();
      _descriptionController.dispose();


      super.dispose();
    }




    clearText(){

      _userinformationController.clear();
      _userdescriptionController.clear();
      _firstnameController.clear();
      _lastnameController.clear();
      _emailController.clear();
      _genderController.clear();
      //  _educationController.clear();
      _tiltleController.clear();
      _descriptionController.clear();



    }
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    // Build a Form widget using the _formKey created above.
    return Scaffold(

        appBar: AppBar(

          title: Text('Edit'),


        ),

        body:
        SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                     controller: _userinformationController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                    //  initialValue:  widget.produt['usertitle'].toString(),
                      // onChanged: (value) {
                      //
                      //     _userinformationController.text = value;
                      //
                      // },
                      onSaved: (value){
                        _userinformationController.text=value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText:'User information',
                        hintText: 'User information',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter User information';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                     controller: _userdescriptionController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                     // initialValue: widget.produt['userdescription'].toString(),
                      // onChanged: (value) {
                      //   _userdescriptionController.text = value;
                      // },
                      onSaved: (value){
                        _userdescriptionController.text=value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'User details',
                        labelText:'User details',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter User details';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                     controller: _tiltleController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                     // initialValue:  widget.produt['title'].toString().toString(),
                      // onChanged: (value) {
                      //   _tiltleController.text = value;
                      // },
                      onSaved: (value){
                        _tiltleController.text=value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Personal information',
                        labelText:'Personal information',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Personal information';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                     controller: _descriptionController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                     // initialValue:  widget.produt['description'].toString().toString(),
                      // onChanged: (value) {
                      //   _descriptionController.text = value;
                      // },
                      onSaved: (value){
                        _descriptionController.text=value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Personal detail',
                        labelText: 'Personal detail',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Personal detail';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Enter First Name*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                   controller: _firstnameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      //initialValue:  widget.produt['firstname'].toString().toString(),
                      // onChanged: (value) {
                      //   _firstnameController.text = value;
                      // },
                      onSaved: (value){
                        _firstnameController.text=value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'First Name',
                        labelText: 'First Name',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Last name*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      controller: _lastnameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      //initialValue:  widget.produt['lastname'].toString().toString(),
                      // onChanged: (value) {
                      //   _lastnameController.text = value;
                      // },
                      onSaved: (value){
                        _lastnameController.text=value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Last Name',
                        labelText:'Last Name',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Last name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Eamil*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: false,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                   //   initialValue:  widget.produt['email'].toString().toString(),
                      // onChanged: (value) {
                      //   _emailController.text = value;
                      // },
                      onSaved: (value){
                        _emailController.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText:"Email",
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)
                          )

                      ),
                      validator: (value){
                        if(value==null||value.isEmpty)
                        {
                          return "Enter your email";
                        }
                        if(!regex.hasMatch(value))
                        {
                          return "Enter your valid email";
                        }
                        return null;
                      },



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Gender*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Radio<String>(
                          value: "Male",
                          groupValue: _genderRadioBtnVal,
                          onChanged: _handleGenderChange,
                        ),
                        Text("Male"),
                        Radio<String>(
                          value: "Female",
                          groupValue: _genderRadioBtnVal,
                          onChanged: _handleGenderChange,
                        ),
                        Text("Female"),
                        Radio<String>(
                          value: "Other",
                          groupValue: _genderRadioBtnVal,
                          onChanged: _handleGenderChange,
                        ),
                        Text("Other"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Educations Qualification*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black26),



                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('  Choose..', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey)),
                            value: education,
                            items:educations.map((ite) =>
                                DropdownMenuItem<String>(
                                  value: ite,

                                  child: Text(ite, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)
                                  )
                                  ,))
                                .toList(),

                            onChanged: (items) =>
                                setState(() => education = items),),
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child:ElevatedButton(
                      style: ButtonStyle(
                       // backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
//color: Color.fromRGBO(100, 0, 0, 10),

                      onPressed: (){
                        if(_formKey.currentState!.validate())
                        {
                          setState(()
                          {

                            userinformation=_userinformationController.text;
                            userdescription=_userdescriptionController.text;
                            firstname=_firstnameController.text;
                            lastname=_lastnameController.text;
                            email=_emailController.text;
                            //gender=_genderController.text;
                           // education=_educationController.text;
                            title=_tiltleController.text;
                            description=_descriptionController.text;

                            //  url=_imageController.text;
                            // py=_pyController.text;
                            // pr=_prController.text;
                            // _uploadImage();
                            editUser();


                            //   Fluttertoast.showToast(msg: "Posted");

                          });
                        }},
                      child: Text("Update"),

                    ),
                  ),












                ]
            ),
          ),
        ),
    );
  }

  void _handleGenderChange(String? value) {
    setState(() {
      _genderRadioBtnVal = value!;
    });
  }



}