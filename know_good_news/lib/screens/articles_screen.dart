import 'dart:io';

import 'package:flutter/material.dart';
import 'package:know_good_news/Models/Player.dart';
import 'package:know_good_news/styles/color_styles.dart';
import 'package:swipedetector/swipedetector.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key key, this.player, this.firstVisit}) : super(key: key);

  final Player player;
  final bool firstVisit;

  @override
  _ArticlePageState createState() => _ArticlePageState();

}

Offset offset = Offset.zero;



class _ArticlePageState extends State<ArticlePage>{
  @override
  Widget build(BuildContext context) {
   /*return Stack(
      children: <Widget>[
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                offset = Offset(offset.dx + details.delta.dx, offset.dy);
              });
            },
            child: Container(
              color: ColorDefinitions.backgroundColor,
              margin: EdgeInsets.all(25.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Scientists Hack Plant DNA",
                    style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  getIconBar()
                ],
              ),
            )
          ),
        ),
      ],
    );*/

    return Scaffold(
        appBar: AppBar(
          title: Text("replace with player.get"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createSwipeDetector(
                  Card(
                    color: ColorDefinitions.backgroundColor,
                    margin: EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text("Scientists Hack Plant DNA",
                          style: TextStyle(
                              fontSize: 45,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        getIconBar()
                      ],
                    ),
                  )
              ), //SwipeDetector
            ],
          ),
        ),
    );
  }

  SwipeDetector createSwipeDetector(Widget child){
    return new SwipeDetector(
        child: child,
        onSwipeLeft: _accept,
        onSwipeRight: _reject,
    );
  }

  void _accept(){
    print("accept article");
  }

  void _reject(){
    print("reject article");
  }

  Column getIconBarColumn(int codePoint, String text){
    return Column(
        children: [
          Row(
            children: <Widget>[
              Icon(IconData(codePoint, fontFamily: 'MaterialIcons')),
              Text(text),
            ],
          ),
        ]
    );
  }

  Row getIconBar(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getIconBarColumn(0xe548, ""),
        getIconBarColumn(0xe7ef, "82%"),
        getIconBarColumn(0xe227, "5"),
      ],
    );
  }
}