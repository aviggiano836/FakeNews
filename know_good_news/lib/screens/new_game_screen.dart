import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:know_good_news/styles/button_themes.dart';

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
              data: ButtonStyles.buttonTheme.data,
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