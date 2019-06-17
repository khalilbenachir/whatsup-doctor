import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BubbleScreen.dart';
import 'package:whatsapp_redesign/model/chat_model.dart';

class Home extends StatelessWidget {
  final String listType;

  Home(this.listType);

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
          listType.toUpperCase(),
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
            child: ListView.builder(
                itemBuilder: (context, position) {
                  return new Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                              backgroundImage: AssetImage(
                                  ChatMockData[position].imageUrl),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return BubbleScreen(
                                        ChatMockData[position].name
                                            .toUpperCase());
                                  }));
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
