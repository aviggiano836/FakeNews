import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:know_good_news/Models/Player.dart';
import 'package:know_good_news/screens/articles_screen.dart';

import 'package:know_good_news/screens/new_game_screen.dart';
import 'package:know_good_news/styles/button_themes.dart';
import 'package:know_good_news/styles/color_styles.dart';
import 'package:know_good_news/styles/text_styles.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToArticles(BuildContext context) {
    //check that user has existing game
    bool hasExisting = false; //does user have game to continue
    if (hasExisting){
      //send user to article page
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
            new ArticlePage(player: new Player("new"), firstVisit: false,)
      ));

    } else { //send them toast notification
      Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: Text("No existing data, start a new game to play"),
            duration: Duration(seconds: 3)
          )
      );
    }
  }

  void _startNewGame(){ //send user to create page
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewGamePage(title: "New Game",)));
  }

  @override
  Widget build(BuildContext context) {
    final ButtonTheme buttonTheme = ButtonStyles.getFullWidthButtonTheme(context);

    // This method is rerun every time setState is called
    return Scaffold(
      
      body: Center(
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              //width: MediaQuery.of(context).size.width,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Know Good News",
                      style: TextStyles.titleStyleColor,
                    ),
                    Text(
                      "A News Editor Sim",
                      style: TextStyles.subtitleStyle,
                    )
                  ],
                ),
                ButtonTheme.fromButtonThemeData(
                  data: buttonTheme.data,
                  child: Column(
                    children: <Widget>[
                      Builder(
                        builder: (context) => Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: RaisedButton(
                              child: new Text("Continue", textScaleFactor: 2.0,),
                              onPressed: () => _goToArticles(context),
                            ),
                          )
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: RaisedButton(
                            child: new Text("New Game", textScaleFactor: 2.0,),
                            onPressed: _startNewGame,
                          ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}