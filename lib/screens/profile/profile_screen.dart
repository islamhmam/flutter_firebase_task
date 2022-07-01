// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/profile/cubit/profile_cubit.dart';
import 'package:flutter_task/screens/profile/cubit/profile_states.dart';
import 'package:flutter_task/screens/progress_screen/progress_screen.dart';
import 'package:universal_io/io.dart';
import 'package:universal_io/prefer_sdk/io.dart';
import 'package:universal_io/prefer_universal/io.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends  StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool imageAvailable = false;
  late Uint8List imageFile;
  bool buttomLoading =false;
  bool chooseError =false;
  String? fireImageUrl;
  var dateOfBirthCon=TextEditingController();

 
  // @override
  // void initState() {
  //    dateOfBirthCon.text='';
  //    super.initState();
  // }

  
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state) {
        },
        builder: (context,state){

          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProgressScreen(),));
                  },
                  color: Colors.black38,
                  child: Text('GO TO PROGRESS SCREEN',
                  style: TextStyle(
                    color: Colors.white
                  ),),

                ),
              ),
            ),
            backgroundColor: Colors.grey[200],
            body:(state is GetProfileLoadingState)?
            Center(child: CircularProgressIndicator())
            :
            Builder(
              builder: (context) {
                if(ProfileCubit.firstTime) {
                  dateOfBirthCon.text=ProfileCubit.get(context).dateOfBirth!;
                  ProfileCubit.firstTime=false;
                }
                return  SingleChildScrollView(
                  child:
                  Column(
                    children: [
                      SizedBox(height: 30,),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () async {
                          final image = await ImagePickerWeb.getImageAsBytes();

                          setState(() {
                            imageFile = image!;
                            imageAvailable = true;
                          });
                        },
                        child: ClipOval(
                          child:
                          imageAvailable ?
                          Image.memory(
                            imageFile,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ) :
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                            imageUrl: '${ProfileCubit.get(context).imageUrl}',
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: TextFormField(
                          onTap: () async {

                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateOfBirthCon.text = formattedDate; //set output date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }
                          },
                          controller: dateOfBirthCon,
                          decoration: InputDecoration(
                            label: Text('Click to Choose Birth Date..'),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          readOnly: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Write Email...';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      if(chooseError)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red[100],
                            child: Text('Choose photo and Date'),
                          ),
                        ),
                      MaterialButton(
                        height: 50,
                        color: Colors.blue,
                        onPressed: () async {

                          if(imageAvailable&& dateOfBirthCon.text.isNotEmpty){
                            setState((){
                              buttomLoading=true;
                            });
                            String uId=await FirebaseAuth.instance.currentUser!.uid;
                            await FirebaseStorage.instance
                                .ref()
                                .child('profileImages/$uId')
                                .putData(imageFile)
                                .then((val) {
                              val.ref.getDownloadURL().then((value) async {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(uId)
                                    .set({
                                  'profileImage': value.toString(),
                                  'dateOfBirth':dateOfBirthCon.text.trim()
                                }).then((value){
                                  setState((){
                                    buttomLoading=false;
                                    chooseError=false;
                                  });
                                });
                              });
                            }).catchError((e){
                              print(
                                  '------------ \n ${e.toString()}'
                              );
                              setState((){
                                buttomLoading=false;
                                chooseError=false;

                              });

                            });


                          }else{
                            setState((){
                              chooseError=true;
                            });

                          }

                        },
                        child:buttomLoading?
                        CircularProgressIndicator(
                          color: Colors.white,
                        )
                            :
                        Text(
                          'Update Data',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,

                        ),
                        ),

                      )

                    ],
                  ),
                );
              } ,

            ),
          );
        },
      ),
    );
  }


}
