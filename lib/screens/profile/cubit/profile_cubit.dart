

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit( ) : super(ProfileInitialState());

  static ProfileCubit get(context)=>BlocProvider.of(context);

  static bool firstTime =true;


String? imageUrl;
String? dateOfBirth;

Future<void> getProfileData() async {
  emit(GetProfileLoadingState());
  String uId=FirebaseAuth.instance.currentUser!.uid;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uId)
      .get()
  .then((value) {
    imageUrl=value.data()!['profileImage'];
    dateOfBirth=value.data()!['dateOfBirth'];
    emit(GetProfileSuccessState());
  }).catchError((e){
    print(e.toString());
    emit(GetProfileErrorState(e.toString()));

  });
}



}