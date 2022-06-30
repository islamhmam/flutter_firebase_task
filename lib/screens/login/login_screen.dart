// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/screens/profile/profile_screen.dart';

class LoginScreen extends  StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passCon=TextEditingController();
  var emailCon=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: Colors.blue,
          ),
          child: Center(
            child: Text('LOGIN',
            style: TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 44,
              color: Colors.white
            ),
            ),
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: emailCon,
                decoration: InputDecoration(
                  label: Text('Email'),
                  filled: true,
                  fillColor: Colors.white,
                ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val){
                  if(val!.isEmpty){
                    return 'Write Email...';
                  }
                  },
            ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: passCon,
                decoration: InputDecoration(
                  label: Text('Password'),
                  filled: true,
                  fillColor: Colors.white,
                ),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val){
                  if(val!.isEmpty){
                    return 'Write Password...';
                  }
                  },
            ),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                color: Colors.blue,
                  onPressed: (){
                  if(formKey.currentState!.validate()){
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailCon.text.trim(),
                        password: passCon.text.trim()).then((value){
                          print('----------\n Success Login');
                          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),)
                          );

                    }).catchError((e){

                    });

                  }
                  },
                child: Text(
                  'LOGIN',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),
                ),
              )

            ],
          ),
        )
      ],
      ),
    );
  }
}
