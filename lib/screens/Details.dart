import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => new _DetailsState();
}

class _DetailsState extends State<Details> {
  List<DropdownMenuItem> _listrepas = [];
  String _value;
  List items = getDummyList();

  void loadRepas() {
    _listrepas = [];
    _listrepas.add(new DropdownMenuItem(
      value: "1",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.free_breakfast),
          SizedBox(width: 10),
          Text(
            "petit dejeuner",
          ),
        ],
      ),
    ));
    _listrepas.add(new DropdownMenuItem(
      value: "2",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.brightness_1),
          SizedBox(width: 10),
          Text(
            "dejeuner",
          ),
        ],
      ),
    ));
    _listrepas.add(new DropdownMenuItem(
      value: "3",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.brightness_2),
          SizedBox(width: 10),
          Text(
            "snack",
          ),
        ],
      ),
    ));
    _listrepas.add(new DropdownMenuItem(
      value: "4",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.brightness_3),
          SizedBox(width: 10),
          Text(
            "dinner",
          ),
        ],
      ),
    ));
  }

  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          correctScore++;
          break;
        case 1:
          print("selected");
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loadRepas();
    return Container(
        padding: EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      child: new Text(
                        "ACTION",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio(
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                new Text(
                  'Augmenter',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 1,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                new Text(
                  'Reduire',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            new Divider(
              height: 5.0,
              color: Colors.black,
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      child: new Text(
                        "RATIO DU",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                child: DropdownButton(
                  hint: Text(
                    "Choose your meal ?",
                    textAlign: TextAlign.center,
                  ),
                  items: _listrepas,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  value: _value,
                  elevation: 4,
                  isExpanded: true,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: new Text(
                          "TO",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(4.0),
                ),
                Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Please enter the new value'),
                    ))
              ],
            ),
            Padding(padding: EdgeInsets.all(8)),
            Divider(
              height: 5.0,
              color: Colors.black,
            ),
            Padding(padding: EdgeInsets.all(8)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(3),
                      child: OutlineButton(
                        highlightElevation: 21,
                        color: Colors.white,
                        shape: StadiumBorder(),
                        textColor: Colors.lightBlue,
                        child: Text(
                          'AJOUTER',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.lightBlue,
                          ),
                        ),
                        borderSide: BorderSide(
                            color: Colors.lightBlue,
                            style: BorderStyle.solid,
                            width: 1),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Expanded(
                child: Container(
                    child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(items[index]),
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                            ),
                          ],
                          color: Colors.white,
                          border:
                              Border.all(width: .0, color: Colors.lightBlue)),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            items[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )))
          ],
        ));
  }

  void resetSelection() {
    _handleRadioValueChange1(-1);
    correctScore = 0;
  }

  void validateAnswers() {
    if (_radioValue1 == -1 &&
        _radioValue2 == -1 &&
        _radioValue3 == -1 &&
        _radioValue4 == -1 &&
        _radioValue5 == -1) {
      print('Please select atleast one answer');
    } else {
      print('Your total score is: $correctScore out of 5');
    }
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
