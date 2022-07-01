// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/progress_screen/components/session_item.dart';
import 'package:flutter_task/screens/progress_screen/cubit/progress_cubit.dart';
import 'package:flutter_task/screens/progress_screen/cubit/progress_states.dart';

class ProgressScreen extends  StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgressCubit()..getSessions(),
      child: BlocConsumer<ProgressCubit,ProgressStates>(
       listener: (context, state) {

       },
        builder:(context, state) {
         var cubit=ProgressCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text('PROGRESSES',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
              ),
            ),
            body: Container(
              width: double.infinity,
              child: (state is GetProgressLoadingState)?
                  Center(child: CircularProgressIndicator())
              :
                  ListView.separated(
                  itemBuilder: (context, index) => SessionItem(
                    cubit.sessions[index],
                  ),
                  separatorBuilder:(context,index)=> SizedBox(height: 10,),
                  itemCount: cubit.sessions.length),
            ),
          );
        } ,
      ),
    );
  }
}
