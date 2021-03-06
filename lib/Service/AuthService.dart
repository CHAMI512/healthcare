
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screen/PatientHome.dart';
import 'package:health_care/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sharedpref.dart';
class AuthService {
  dynamic error="";
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Users _userFromFirebaseUser(User user){
    return user!=null ? Users(uid: user.uid) : null;
  }
  Stream<Users> get user {
    return _auth.authStateChanges()

        .map(_userFromFirebaseUser);
  }
  displayerror(){
    return error.replaceRange(error.indexOf("["), error.indexOf(" "), "");
  }

  String showemail(){
    final User user = _auth.currentUser;
    String emailid = user.email;
    if(emailid==null){
      emailid="guest";
    }

    return emailid;
  }
  // sign in anon
  Future signInAnon() async {
    try {

      UserCredential result = await _auth.signInAnonymously();
      User user = result.user ;
      return user;
    } catch (e) {
      error=e.toString();
      print(e.toString());
      return null;
    }
  }



// sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid=_auth.currentUser.uid;
      SharedPreferenceHelper().saveUserId(uid);
      double bmr=1798;
      SharedPreferences pre = await SharedPreferences.getInstance() ;
      pre.setString("bmr", bmr.toString());
      User user= result.user;
      return _userFromFirebaseUser(user);
    }catch (e){
      error=e.toString();
      print(e);
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(String email,String password,String username ,String age,String height,String bgrp,String weight,BuildContext context) async{

    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String    uid=_auth.currentUser.uid;
      prefs.setString('uid', uid);
      SharedPreferenceHelper().saveUserEmail(email);
      SharedPreferenceHelper().saveUserId(uid);
      SharedPreferenceHelper()
          .saveUserName(username);

      Map<String,dynamic> additems ={

        'username': username,'email': email, 'uid': uid,'age':age,'height':height,"bldgrp":bgrp,"weight":weight,
      };
      CollectionReference reference =FirebaseFirestore.instance.collection("users");
      await reference.add(additems);
     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>PatientDashboard()));
      return _userFromFirebaseUser(user);
    }catch (e) {
      error=e.toString();
      print(e);
      return null;
    }
  }


//reset passowrd
  Future resetPassword(String email) async {
    try{

      await _auth.sendPasswordResetEmail(email: email);
      error= "Reset email send ";
    }catch(e){
      error=e.toString();
      print(e);
      return null;
    }
  }


// sign out
  Future signOut() async{
    try{
      await _auth.signOut();
    }catch(e){
      print(e.toString());
    }

  }

  getCurrentUser() async {
    return await _auth.currentUser;
    print("\n \n\n\n\n\n\n\n\n \n \n \n \n \n n lalsa \n");
  }
}