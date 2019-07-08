import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:whatsapp_redesign/model/Bubble.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_redesign/screens/Details.dart';
import 'package:whatsapp_redesign/screens/GlobalList.dart';

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
  String _commentaire = "Bien , Continue";
  List _messages = [];
  String url;

  @override
  initState() {
    super.initState();
    enableButton = true;
    _loadData();

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
                        url = 'http://192.168.1.119:8000/api/update?id=' +
                            GlobalList.userId.toString() +
                            '&com=' +
                            _commentaire.replaceAll(
                                new RegExp(r"\s+\b|\b\s"), "_");

                        _sendData();
                        setState(() {
                          GlobalList.messages.add(_commentaire);
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
                        url = 'http://192.168.1.119:8000/api/update?id=' +
                            GlobalList.userId.toString() + '&com=' +
                            _messageController.text
                                .replaceAll(new RegExp(r"\s+\b|\b\s"), "_");
                        _sendData();

                        _messageController.clear();
                        setState(() {
                          // url = 'http://192.168.1.119:8000/api/users/?id=' +
                          //   GlobalList.userId.toString();
                        });
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
            GlobalList.instructions = [];

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
                        itemCount: _messages.length,
                        itemBuilder: (context, position) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Bubble(
                                  message: _messages[position],
                                  time: DateFormat('HH:mm')
                                      .format(DateTime.now()),
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

  Future _sendData() async {
    var res = await get(url);

    print(res.body);
  }

  Future _loadData() async {
    String _urlAddress = 'http://192.168.1.119:8000/api/users/commentaires/' +
        GlobalList.userId.toString();
    var res = await get(_urlAddress);

    var _dataLoaded = json.decode(res.body);

    for (int i = 0; i < _dataLoaded['commentaires'].length; i++) {
      if (_dataLoaded['commentaires'][i]['patient_id'].toString().compareTo(
          GlobalList.userId.toString()) == 0) {
        setState(() {
          _messages.add(_dataLoaded['commentaires'][i]['contenue']);
        });
      }
    }

    print(_dataLoaded['commentaires'][0]);
    print(_dataLoaded.length);
  }
}
