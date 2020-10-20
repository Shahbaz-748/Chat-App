
import 'package:code_app/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(

         leading: Icon(
           Icons.send,
           size: 35.0,
           color: Colors.black87 ,
         ),
         backgroundColor: Color(0xFF2D2D2D),
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0,top:5.0,bottom:8.0),
            child: Text(
        'Missive Chat ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
       ),
          ),
       ),

      body: Container(
        constraints: BoxConstraints.expand(),
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("images/welcomeScreen.jpg"),
             fit: BoxFit.cover,
           ),
         ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Icon(
                Icons.message,
                size: 80.0,
                color: Colors.yellow,
              ),

              SizedBox(
                height: 30.0,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RawMaterialButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },

                  fillColor: Colors.red,
                  elevation: 5.0,
                  constraints: BoxConstraints(minWidth: 200.0,minHeight: 50.0),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Text(
                      " Sign In ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      )
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RawMaterialButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  fillColor: Colors.red,
                  elevation: 5.0,
                  constraints: BoxConstraints(minWidth: 200.0,minHeight: 50.0),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Text(
                      " Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      )
                  ),
                ),
              ),
            ],
          ) ,



      ),
    );
  }
}
