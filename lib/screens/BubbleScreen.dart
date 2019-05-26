import 'package:flutter/material.dart';
import 'Bubble.dart';
import 'Details.dart';

class BubbleScreen extends StatefulWidget {
  final String _patientName;

  BubbleScreen(this._patientName);

  @override
  _BubbleScreenState createState() => _BubbleScreenState(_patientName);
}

class _BubbleScreenState extends State<BubbleScreen> {
  bool enableButton;

  final String _patientName;

  @override
  initState() {
    super.initState();
    enableButton = false;
  }

  _BubbleScreenState(this._patientName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.transparent, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 80.0,
                  ),
                ]),
                child: InkWell(
                  child: Icon(Icons.add_box),
                  onTap: () {
                    setState(() {
                      enableButton = !enableButton;
                    });
                  },
                ),
                margin: EdgeInsets.all(2),
              ),
            ),
            Expanded(
                child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter your comment here',
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.black,
                ),
                filled: true,
                contentPadding: EdgeInsets.all(15),
                fillColor: Colors.white,
              ),
            )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration:
                      BoxDecoration(color: Colors.transparent, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 80.0,
                    ),
                  ]),
                  child: InkWell(child: Icon(Icons.send), onTap: () {}),
                  margin: EdgeInsets.all(2)),
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .9,
        title: Text(
          _patientName,
          style: TextStyle(color: Color(0xFF4CB8E2)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4CB8E2),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: enableButton
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Bubble(
                    message: 'Hi there, this is a message',
                    time: '12:00',
                    delivered: true,
                    isMe: false,
                  ),
                  Bubble(
                    message: 'Nice one, Flutter is awesome',
                    time: '12:00',
                    delivered: true,
                    isMe: true,
                  ),
                  Bubble(
                    message: 'Whatsapp like bubble talk',
                    time: '12:01',
                    delivered: true,
                    isMe: false,
                  ),
                  Bubble(
                    message: 'Nice one, Flutter is awesome',
                    time: '12:00',
                    delivered: true,
                    isMe: true,
                  ),
                  Bubble(
                    message: 'I\'ve told you so dude!',
                    time: '12:00',
                    delivered: true,
                    isMe: false,
                  ),
                ],
              ),
            )
          : Center(
              child: Details(),
            ),
    );
  }
}
