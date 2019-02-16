import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewGamePage extends StatefulWidget{
  NewGamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewGamePageState createState() => _NewGamePageState();

}

class _NewGamePageState extends State<NewGamePage>{
  void _beginGame(){
      //begin game for the first time
  }

  @override
  Widget build(BuildContext context) {
    final ButtonTheme buttonTheme = new ButtonTheme(
      buttonColor: Colors.lightGreen,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Whats your companies name?"),
            Container(
              width: MediaQuery.of(context).size.width * .75,
              child: TextField(
                autofocus: true,
                maxLength: 35,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            ButtonTheme.fromButtonThemeData(
              data: buttonTheme.data,
              child: RaisedButton(
                onPressed: _beginGame,
                child: Text("Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}