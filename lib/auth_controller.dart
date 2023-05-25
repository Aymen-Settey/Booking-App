import 'package:loginpage/login_page.dart';
import 'package:loginpage/mainapp/screen/bottom_bar.dart';
import 'package:loginpage/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/mainapp/screen/home_screen.dart';

class AuthController extends GetxController{
  //AuthController.instance..
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user =Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }
  _initialScreen(User? user){
    if(user==null){
      print("Login page");
      Get.offAll(()=>BottomBar());

    }else{
      Get.offAll(()=>BottomBar());
    }
  }
  void register(String email, password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);

    }catch(e){
      Get.snackbar("About user", "User message",snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(

            e.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          )
      );

    }
  }
  void login(String email, password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);

    }catch(e){
      Get.snackbar("About login", "Login message",snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(

            e.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          )
      );

    }
  }
  void logOut()async{
    await auth.signOut();
  }
}