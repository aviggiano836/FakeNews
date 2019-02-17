import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:know_good_news/screens/articles_screen.dart';

import 'package:know_good_news/styles/button_themes.dart';

class NewGamePage extends StatefulWidget{
  NewGamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewGamePageState createState() => _NewGamePageState();

}

class _NewGamePageState extends State<NewGamePage>{
  //controller used to grab name
  final nameFieldCtrl = new TextEditingController();

  void _beginGame(TextEditingController tec){
      //begin game for the first time,
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
          new ArticlePage(title: tec.text, firstVisit: true,)
      ));
  }

  //Override to dispose of defined controllers
  @override
  dispose() {
    nameFieldCtrl.dispose();
    super.dispose();
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
                controller: nameFieldCtrl,
              ),
            ),
            ButtonTheme.fromButtonThemeData(
              data: ButtonStyles.buttonTheme.data,
              child: RaisedButton(
                onPressed: () => _beginGame(nameFieldCtrl),
                child: Text("Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}