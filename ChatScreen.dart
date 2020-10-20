import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<MessageText> msgWidget = [];
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkingUser();
  }

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User user;
  String message;
  final _controller=TextEditingController();

  void checkingUser() async {
    final newUser = _auth.currentUser;
    if (newUser != null) {
      user = newUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PariLovesSneha'),
        backgroundColor: Color(0xFF2D2D2D),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Colors.white30,
              size: 30.0,
            ),
          ),
        ],
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: StreamBuilder<QuerySnapshot>(
               stream: _firestore.collection('Messages').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {

                     return CircularProgressIndicator();
                }
                    final messages = snapshot.data.docs;
                    for (var message in messages) {
                      final text = message.data()['Message'];
                      final sender = message.data()['Sender'];
                      msgWidget.add(MessageText(text));
                    }
                  return ListView(
                    children: msgWidget,
                  );
                }


                  ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        message=value;
                      },
                      style: TextStyle(
                         color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.insert_emoticon,
                          size: 30,
                          color: Colors.white30,
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                        filled: true,
                        fillColor: Colors.white30,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.black38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                       onTap:() {
                          _firestore.collection('Messages').add({
                         ' Message': message,
                          'Sender':user.email
                          });
                          setState(() {
                            _controller.clear();
                          });

                       },
                      child: Icon(
                        Icons.send,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class MessageText extends StatelessWidget {
  final  message;
  MessageText(this.message);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(

            color: Colors.red,
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
             message.toString(),
            style: TextStyle(
               color:  Colors.white30,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )
          ),
        ),
      ),
    );
  }
}
