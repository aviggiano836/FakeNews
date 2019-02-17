import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:know_good_news/screens/articles_screen.dart';

import 'package:know_good_news/styles/button_themes.dart';
import 'package:know_good_news/Models/Player.dart';
import 'package:know_good_news/styles/color_styles.dart';

class NewGamePage extends StatefulWidget{
  NewGamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewGamePageState createState() => _NewGamePageState();

}

class _NewGamePageState extends State<NewGamePage>{
  //controller used to grab name
  final nameFieldCtrl = new TextEditingController();

  void _beginGame( BuildContext cont, TextEditingController tec ){
      //begin game for the first time,
      if (tec.text.length == 0){
        Scaffold.of(cont).showSnackBar(
            new SnackBar(
                content: Text("Invalid name, think of something clever"),
                duration: Duration(seconds: 3)
            )
        );
      } else {
        Player player = new Player(tec.text);
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
            new ArticlePage(player: player, firstVisit: true,)
        ));
      }
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
      backgroundColor: ColorDefinitions.tertiaryColor,
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
              Builder(
                builder: (context) => Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: ButtonTheme.fromButtonThemeData(
                            data: ButtonStyles.buttonTheme.data,
                            child: RaisedButton(
                                onPressed: () => _beginGame(context, nameFieldCtrl),
                                child: Text("Start"),
                        ),

                        )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}