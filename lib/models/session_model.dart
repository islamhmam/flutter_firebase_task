import 'dart:core';

class SessionModel{
  num? score;
  num? anxiety;
  String? startDate;
  String? endDate;


  SessionModel({
    this.score,
    this.anxiety,
    this.startDate,
    this.endDate,

  });

  SessionModel.fromJson(Map<String,dynamic> json){

    score = json['score'];
    anxiety = json['anxiety'];
    startDate = json['startDate'];
    endDate = json['endDate'];

  }

  Map<String,dynamic> toMap(){
    return{
      'score':score,
      'anxiety':anxiety,
      'startDate':startDate,
      'endDate':endDate,

    };

  }



}