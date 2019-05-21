import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discusion extends StatelessWidget {
  Discusion(this.listType);

  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 2,
        title: new Text(
          listType,
          style: new TextStyle(color: const Color(0xFFFFFFFF)),
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex:8,
                child: Container()),
            Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                    decoration: new InputDecoration(
                      prefix: Icon(Icons.add_circle_outline),
                      suffix: Icon(Icons.send),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: Color(0xFF2845E7), width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      labelText: 'commentaire',
                      contentPadding: EdgeInsets.all(13.0),

                      labelStyle: new TextStyle(color: Color(0xFF2845E7)),
                    ),
                  ),
                  width: 350,
                ))
          ],
        ),
      ),
    );
  }
}
