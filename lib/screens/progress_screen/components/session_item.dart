// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_task/models/session_model.dart';
import 'package:flutter_task/screens/progress_screen/components/score_anxietty.dart';
import 'package:flutter_task/screens/progress_screen/components/start_end_date.dart';

class SessionItem extends  StatelessWidget {
   SessionItem(this.sessionModel,{Key? key}) : super(key: key);
SessionModel sessionModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow:  [
            BoxShadow(
              offset: Offset(
                5,5,
              ),
              color: Colors.blue[200]!,
              blurRadius: 5,
            )
          ]
      ),

      child: Column(
        children: [
          SizedBox(height: 10,),
          ScoreAnxiety(sessionModel),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: Container(
              height: 1,
              color: Colors.blue,

            ),
          ),
          StartEndDate(
            sessionModel
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}
