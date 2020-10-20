import 'package:code_app/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  String username;
  String password;
 final _auth = FirebaseAuth.instance;
  final myController=TextEditingController();
  final myControl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                child: TextField(
                  controller: myController,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.perm_identity,
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 20.0, bottom: 2.0, top: 2.0, right: 10.0),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 3.0, color: Colors.red),
                    ),
                    fillColor: Colors.white,
                    hintText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: myControl,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.assignment,
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 20.0, bottom: 2.0, top: 2.0, right: 10.0),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 3.0, color: Colors.red),
                    ),
                    fillColor: Colors.white,
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RawMaterialButton(
                  onPressed: () async {
                    try {
                      final registeredUser =
                      await _auth.createUserWithEmailAndPassword(
                          email: username, password: password);
                      if (registeredUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      }
                    } catch (e) {
                      print(e);
                    }
                    myController.clear();
                    myControl.clear();
                    },

                  fillColor: Colors.red,
                  elevation: 5.0,
                  constraints: BoxConstraints(minWidth: 70.0, minHeight: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Text(" Sign Up ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
