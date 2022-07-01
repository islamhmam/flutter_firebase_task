import 'package:flutter/material.dart';
import 'package:flutter_task/models/session_model.dart';

class ScoreAnxiety extends  StatelessWidget {
   ScoreAnxiety(this.sessionModel,{Key? key}) : super(key: key);
  SessionModel sessionModel;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height:150 ,
                  width: MediaQuery.of(context).size.width/7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.blue[900]!,
                            Colors.blueAccent,
                          ]
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(
                            5,5,
                          ),
                          color: Colors.black,
                          blurRadius: 5,
                        )
                      ]
                  ),
                  child: Center(
                    child: Text('${sessionModel.score}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),),
                  ),
                ),
                SizedBox(height: 10,),
                Text('SCORE',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height:150 ,
                      width: MediaQuery.of(context).size.width/15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[400],
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(
                                5,5,
                              ),
                              color: Colors.black,
                              blurRadius: 5,
                            )
                          ]
                      ),


                    ),
                    Container(
                      height:(sessionModel.anxiety!/7)*150 ,
                      width: MediaQuery.of(context).size.width/15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.blue[900]!,
                              Colors.blueAccent,
                            ]
                        ),

                      ),

                    )

                  ],
                ),
                SizedBox(height: 10,),
                Text('ANXIETY',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
