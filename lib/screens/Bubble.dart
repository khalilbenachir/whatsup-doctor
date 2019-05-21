import 'package:flutter/material.dart';
import 'CustomTextField.dart';

class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.white : Colors.blueAccent.shade100;
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
      topRight: Radius.circular(5.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(5.0),
    )
        : BorderRadius.only(
      topLeft: Radius.circular(5.0),
      bottomLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(10.0),
    );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BubbleScreen extends StatelessWidget {
  bool enableButton = false;

  BubbleScreen(this._patientName);

  final String _patientName;

  @override
  Widget build(BuildContext context) {
    var textInput = Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              onChanged: (text) {},
              decoration: InputDecoration.collapsed(
                hintText: "Type a message",
              ),
            ),
          ),
        ),
        enableButton
            ? IconButton(
          color: Theme
              .of(context)
              .primaryColor,
          icon: Icon(
            Icons.send,
          ),
          disabledColor: Colors.grey,
        )
            : IconButton(
          color: Colors.blue,
          icon: Icon(
            Icons.send,
          ),
          disabledColor: Colors.grey,
          onPressed: null,
        )
      ],
    );

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
            child: Icon(Icons.add_box),margin: EdgeInsets.all(2),),
      ),
      Expanded(
    child: TextField(
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
        prefixIcon: Icon(Icons.sentiment_very_satisfied),
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
    child: Icon(Icons.send),margin: EdgeInsets.all(2)),
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
    style: TextStyle(color: Color(0xFF2845E7)),
    ),
    leading: IconButton(
    icon: Icon(
    Icons.arrow_back_ios,
    color: Color(0xFF2845E7),
    ),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    ),
    body: Padding(
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
    ),
    );
  }
}
