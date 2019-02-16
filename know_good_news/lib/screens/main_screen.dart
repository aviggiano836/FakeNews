import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:know_good_news/screens/new_game_screen.dart';
import 'package:know_good_news/styles/color_styles.dart';


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
  void _goToArticles() {
    //check that user has existing game
    setState(() {

      //go to articles page
    });
  }

  void _startNewGame(){
    //start a new game
      /*Navigator.push(
        ,
        new MaterialPageRoute(builder: (ctxt) => new SecondScreen()),
      );*/
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewGamePage(title: "New Game",)));
  }

  @override
  Widget build(BuildContext context) {
    final ButtonTheme buttonTheme = new ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 100.0,
      textTheme: ButtonTextTheme.primary,
      buttonColor: ColorDefinitions.secondaryColor,
    );

    // This method is rerun every time setState is called
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                ButtonTheme.fromButtonThemeData(
                  data: buttonTheme.data,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: RaisedButton(
                          child: new Text("Continue", textScaleFactor: 2.0,),
                          onPressed: _goToArticles,
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