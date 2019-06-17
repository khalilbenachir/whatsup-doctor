import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/model/Bubble.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_redesign/screens/Details.dart';
import 'GlobalList.dart';

class BubbleScreen extends StatefulWidget {
  final String _patientName;

  BubbleScreen(this._patientName);

  @override
  _BubbleScreenState createState() => _BubbleScreenState(_patientName);
}

class _BubbleScreenState extends State<BubbleScreen> {
  TextEditingController _messageController = new TextEditingController();
  bool enableButton;
  final String _patientName;

  @override
  initState() {
    super.initState();
    enableButton = true;
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
                child: IconButton(
                  icon: Icon(Icons.add_box),
                  onPressed: () {
                    enableButton = !enableButton;
                    setState(() {});
                  },
                ),
                margin: EdgeInsets.all(2),
              ),
            ),
            Expanded(
                flex: 2,
                child: TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a comment',
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: InkWell(
                      child: Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.black,
                      ),
                      onTap: () {
                        setState(() {
                          GlobalList.messages.add("Bien , Continue ...");
                        });
                      },
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
                  child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        GlobalList.messages.add(_messageController.text);


                        _messageController.clear();
                        setState(() {});
                      }),
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
          style: TextStyle(color: Colors.deepOrange),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepOrange,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: GlobalList.messages.length,
                        itemBuilder: (context, position) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Bubble(
                                  message: GlobalList.messages[position],
                                  time: DateFormat('HH:mm').format(
                                      DateTime.now()),
                                  isMe: false),

                            ],
                          );
                        }),
                  ),
                )
              ]))
          : Center(
        child: Details(),
      ),
    );
  }


}
