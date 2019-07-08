import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'BubbleScreen.dart';
import 'GlobalList.dart';

class Home extends StatefulWidget {
  final String listType;

  Home(this.listType);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _messages = [];
  List _users = [];
  List _idUsers = [];
  var isLoading = true;

  String _imageUrl = 'lib/assets/doctor.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFF8767),
                Color(0xFFFFA891),
              ],
            ),
          ),
        ),
        title: new Text(
          widget.listType.toUpperCase(),
          style: new TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        titleSpacing: -1.0,
        leading: new IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {}),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Padding(padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 8.0)),
          new Expanded(
            child: isLoading
                ? Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.deepOrangeAccent),
              ),
            )
                : ListView.builder(
                itemBuilder: (context, position) {
                  return new Padding(
                      padding:
                      const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: new Card(
                          elevation: 1.0,
                          color: const Color(0xFFFFFFFF),
                          child: new ListTile(
                            leading: new CircleAvatar(
                              child: Container(
                                width: 100.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.deepOrangeAccent)),
                              ),
                              backgroundImage: AssetImage(_imageUrl),
                            ),
                            onTap: () {
                              GlobalList.userId =
                                  int.parse(_idUsers[position]);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return BubbleScreen(
                                        _users[position].toUpperCase());
                                  }));
                            },
                            title: new Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(
                                  _users[position],
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  DateFormat('HH:mm')
                                      .format(DateTime.now())
                                      .toString(),
                                  style: new TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                              ],
                            ),
                            subtitle: new Container(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: new Text(
                                _messages[position],
                                style: new TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                            ),
                          )));
                },
                itemCount: _messages.length),
          )
        ],
      ),
    );
  }

  Future _loadData() async {
    String _urlUsers = 'http://192.168.1.119:8000/api/users';

    var response = await get(_urlUsers);

    var _dataUsers = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });

      for (int i = 0; i < _dataUsers['patients'].length; i++) {
        _idUsers.add(_dataUsers['patients'][i]['id'].toString());
        _users.add(_dataUsers['patients'][i]['nom']);
      }

      for (int i = 0; i < _idUsers.length; i++) {
        String _urlAddress =
            'http://192.168.1.119:8000/api/users/commentaires/' + _idUsers[i];
        var res = await get(_urlAddress);

        var _dataLoaded = json.decode(res.body);

        if (_dataLoaded['commentaires'][i]['patient_id']
            .toString()
            .compareTo(_idUsers[i].toString()) ==
            0) {
          setState(() {
            _messages.add(_dataLoaded['commentaires'][i]['contenue']);
          });
        }

        print(_dataLoaded['commentaires'][0]);
        print(_messages);
      }
    }
  }
}
