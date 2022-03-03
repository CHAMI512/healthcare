
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Service/AuthService.dart';

import 'Loading.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  AuthService auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading= false;
  bool _PasswordShow = true;
  String error = '';
  String email="";
  String password="";
  String username="",age="",height="",weight="",bgrp="";
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.brown,
title: Text("Signup"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: loading ? Loading() :SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height:  MediaQuery.of(context).size.height*0.01,
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:  Container(
                        padding: EdgeInsets.all(12),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter an email id' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),

                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(             color:Colors.brown,width: 3),
                                  ),
                                  labelText: 'Email',

                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 26,),
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a username' : null,
                                onChanged: (val) {
                                  setState(() => username = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),

                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Name',

                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 26,),

                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a password' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: _PasswordShow,
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                   suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye,           color: Colors.brown,),
                                    onPressed: (){
                                      setState(() {
                                        _PasswordShow=!_PasswordShow;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a age' : null,
                                onChanged: (val) {
                                  setState(() => age = val);
                                },

                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color:Colors.brown,width: 3),
                                  ),
                                  labelText: 'Age',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a Weight' : null,
                                onChanged: (val) {
                                  setState(() => weight = val);
                                },

                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Weight',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a blood group' : null,
                                onChanged: (val) {
                                  setState(() => bgrp = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,

                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Blood Group',
                                  labelStyle: TextStyle(
                                    color:Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a Height' : null,
                                onChanged: (val) {
                                  setState(() => height = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,

                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Height',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),

                              SizedBox(height: 18,),
                              Padding(
                                padding: const EdgeInsets.symmetric( horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonTheme(
                                      minWidth: 110.0,
                                      height: 45.0,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            side: BorderSide(          color: Colors.brown,)
                                        ),
                                        color: Colors.brown,
                                        onPressed: () async{

                                          if(_formKey.currentState.validate()){
                                            setState(() => loading = true);
                                            dynamic result;
                                            result = await auth.registerWithEmailAndPassword(email, password, username,age,height,bgrp,weight, context);
                                            if(result==null){
                                              setState(() {
                                                loading=false;
                                                error= auth.displayerror();
                                              });
                                            }else{

                                            }
                                          }


                                        },
                                        child: const Text("Sign UP",
                                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.027),
                                child: Text(error, style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
