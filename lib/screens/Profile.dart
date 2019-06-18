import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile(this.listType);

  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          elevation: 2,
          title: new Text(
            listType,
            style: new TextStyle(color: const Color(0xFFFFFFFF)),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.black45),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            image: DecorationImage(
                              image: new AssetImage("lib/assets/doctor.png"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 4.0, color: Colors.black)
                            ])),
                    SizedBox(height: 90.0),
                    Text(
                      'DOCTOR doctor',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'General doctor',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),
                    SizedBox(height: 25.0),

                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
