import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

main(List<String> args) {
  runApp(StartingScreen());
}

class StartingScreen extends StatelessWidget {
  static final Image image = Image.asset("assets/images/INSURANCE PNG.png");
   double endPosition;


  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: 10);
    final Ticker _ticker=Ticker((duration){
      Navigator.of(context).pushNamed("/SignUp");
    });
    return
       Scaffold(
        backgroundColor: Colors.deepPurple,

        body: Container(


          padding: EdgeInsets.all(32.0),
          child: Center(
            child: TweenAnimationBuilder(
              duration: Duration(seconds: 3),
              curve: Curves.easeInCirc,
              onEnd: (){
                Navigator.of(context).pushNamedAndRemoveUntil("/SignUp",ModalRoute.withName("/SignUp"));
              },
              tween: Tween<double>(begin:-(MediaQuery.of(context).size.shortestSide*0.5),end:MediaQuery.of(context).size.shortestSide),
              child: image,
              builder:  (context,double position,child){



                return Transform.translate(

                  offset:  Offset(position, 0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,),
                      ),
                      child,


                    ],
                  ),
                );
              },


            ),
          ),
        ),
      );

  }
}
