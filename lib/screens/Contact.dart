import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'GlobalList.dart';
import 'BubbleScreen.dart';
import 'package:whatsapp_redesign/model/chat_model.dart';

class Contact extends StatefulWidget {
  final String listType;

  Contact(this.listType);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Map<String, dynamic> _dataLoaded;
  var isLoading = true;

  _fetchData() async {
    final response = await http.get("http://test-gi.ump.ma/gcalpha/api/users");
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        _dataLoaded = (json.decode(response.body));
      });

      print(_dataLoaded["patients"].length);
      print("test");
    } else {
      throw Exception('Failed to load patients');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    this._fetchData();
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
              onPressed: () {
                _fetchData();
                print(_dataLoaded.length);
              }),
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
                              backgroundColor: Colors.deepOrangeAccent,
                              foregroundColor: Colors.white,
                              child: Text(
                                _dataLoaded["patients"][position]["nom"][0],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),

                            ),
                            onTap: () {
                              setState(() {
                                GlobalList.userId = _dataLoaded["patients"]
                                [position]["id"];
                              });
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return BubbleScreen(_dataLoaded["patients"]
                                    [position]["nom"]
                                        .toUpperCase());
                                  }));
                            },
                            title: new Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(
                                  _dataLoaded["patients"][position]["nom"] +
                                      " " +
                                      _dataLoaded["patients"][position]
                                      ["prenom"],
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )));
                },
                itemCount: _dataLoaded["patients"].length),
          )
        ],
      ),
    );
  }
}
