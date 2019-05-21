import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Bubble.dart';
import 'Discusion.dart';
import 'package:whatsapp_redesign/model/chat_model.dart';

class Home extends StatelessWidget {
  final String listType;

  Home(this.listType);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    final _height = MediaQuery
        .of(context)
        .size
        .height;
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text(
          listType,
          style: new TextStyle(color: const Color(0xFFFFFFFF)),
        ),
        titleSpacing: -1.0,
        leading:
        new IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Padding(padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 8.0)),
          new Expanded(
            child: ListView.builder(
                itemBuilder: (context, position) {
                  return new Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: new Card(
                          elevation: 1.0,
                          color: const Color(0xFFFFFFFF),
                          child: new ListTile(
                            leading: new CircleAvatar(
                              backgroundImage: new AssetImage(
                                  ChatMockData[position].imageUrl),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return BubbleScreen(ChatMockData[position].name.toUpperCase());
                                  })
                              );
                            },
                            title: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(
                                  ChatMockData[position].name,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  ChatMockData[position].time,
                                  style: new TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                              ],
                            ),
                            subtitle: new Container(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: new Text(
                                ChatMockData[position].message,
                                style: new TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                            ),
                          )));
                },
                itemCount: ChatMockData.length),
          )
        ],
      ),
    );
  }
}
