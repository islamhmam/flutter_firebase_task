// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_task/models/session_model.dart';

class StartEndDate extends  StatelessWidget {
   StartEndDate(this.sessionModel,{Key? key}) : super(key: key);
  SessionModel sessionModel;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
     Expanded(
       child: Column(
         children: [
           Center(
             child: Text('${sessionModel.startDate}',
               style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 22,
               ),),
           ),
           Center(
             child: Text('22-10-2022',
               style: TextStyle(
                 color: Colors.grey[700],
                 // fontWeight: FontWeight.bold,
                 fontSize: 15,
                 letterSpacing: 2,
               ),),
           ),
         ],
       ),
     ),
     Expanded(
       child: Column(
         children: [
           Center(
             child: Text('${sessionModel.endDate}',
               style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 22,
               ),),
           ),
           Center(
             child: Text('22-10-2022',
               style: TextStyle(
                 color: Colors.grey[700],
                 // fontWeight: FontWeight.bold,
                 fontSize: 15,
                 letterSpacing: 2,
               ),),
           ),
         ],
       ),
     ),
      ],
    );
  }
}
