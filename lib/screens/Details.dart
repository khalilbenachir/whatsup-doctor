import 'package:flutter/material.dart';
import 'GlobalList.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => new _DetailsState();
}

class _DetailsState extends State<Details> {
  List<DropdownMenuItem> _listrepas = [];
  String _value;
  bool _validate = false;

  TextEditingController _newRatio = new TextEditingController();

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

  int _radioValue1 = 0;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
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
                          color: Colors.deepOrangeAccent,
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
                  activeColor: Colors.deepOrangeAccent,
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
                  activeColor: Colors.deepOrangeAccent,
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
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: DropdownButton(
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Choose your meal ?",
                        textAlign: TextAlign.center,
                      ),
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
                            color: Colors.deepOrangeAccent,
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
                      keyboardType: TextInputType.number,
                      controller: _newRatio,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                        textColor: Colors.deepOrangeAccent,
                        child: Text(
                          'AJOUTER',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent,
                            style: BorderStyle.solid,
                            width: 1),
                        onPressed: () {
                          setState(() {
                            _newRatio.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                            final isDigitsOnly = int.tryParse(_newRatio.text);
                            return isDigitsOnly == null
                                ? _validate = true
                                : _validate = false;
                          });

                          String _outputMessage = "";

                          if (!_validate) {
                            if (_radioValue1 == 0) {
                              _outputMessage += "Augmenter";
                            } else {
                              _outputMessage += "Reduire";
                            }
                            _outputMessage += " le ratio du ";
                            switch (_value) {
                              case "1":
                                {
                                  _outputMessage += "petit dejeuner";
                                }
                                break;
                              case "2":
                                {
                                  _outputMessage += "dejeuner";
                                }
                                break;
                              case "3":
                                {
                                  _outputMessage += "snack";
                                }
                                break;
                              case "4":
                                {
                                  _outputMessage += "dinner";
                                }
                                break;
                              default:
                                {
                                  debugPrint("error");
                                }
                            }

                            _outputMessage += " a " + _newRatio.text;

                            print(_outputMessage);
                            setState(() {
                              GlobalList.messages.add(_outputMessage);
                              GlobalList.instructions.add(_outputMessage);
                            });
                            _newRatio.clear();
                          }
                        },
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
                      itemCount: GlobalList.instructions.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(GlobalList.instructions[index]),
                  onDismissed: (direction) {
                    setState(() {
                      GlobalList.instructions.removeAt(index);
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
                          color: Colors.deepOrangeAccent,
                          border:
                          Border.all(width: .0, color: Color(0xFFF1EEFC))),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            GlobalList.instructions[index],
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontSize: 17.0, color: Colors.white),
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
  }

  void validateAnswers() {
    if (_radioValue1 == -1) {
      print('Please select atleast one answer');
    }
  }
}
