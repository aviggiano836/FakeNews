import 'dart:io';

import 'package:flutter/material.dart';
import 'package:know_good_news/Models/Player.dart';
import 'package:know_good_news/Models/Story.dart';
import 'package:know_good_news/styles/color_styles.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:know_good_news/styles/article_model_styles.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key key, this.player, this.firstVisit}) : super(key: key);

  final Player player;
  final bool firstVisit;

  @override
  _ArticlePageState createState() => _ArticlePageState();

}

Offset offset = Offset.zero;


class _ArticlePageState extends State<ArticlePage>{
  Card _card;
  ArticleModelStyle ams = new ArticleModelStyle();


  Card _createCard(Story story){

    if (ams.getIconFromCat(story.getCat()) == null){
      print("Icon null");
    }
    print("Cred: " + story.getCred().toString());
    print("Cost: " + story.getCost().toString());

    return Card(
      color: ColorDefinitions.backgroundColor,
      margin: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(story.getHeadline(),
            style: TextStyle(
                fontSize: 45,
                fontFamily: "Helvetica",
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          getIconBar(ams.getIconFromCat(story.getCat()), story.getCred().toString(), story.getCost().toString())
        ],
      ),
    );
  }

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
    _card = _createCard(widget.player.printStory());
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.player.getName()),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createSwipeDetector( _card ), //SwipeDetector
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
    //update story
    _card = _createCard(widget.player.printStory());
  }

  void _reject(){
    print("reject article");
    //update story
    _card = _createCard(widget.player.printStory());
  }

  Column getIconBarColumn(Icon icon, String text){
    return Column(
        children: [
          Row(
            children: <Widget>[
              icon,
              Text(text),
            ],
          ),
        ]
    );
  }

  Row getIconBar(Icon catIcon, String cred, String cost){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getIconBarColumn(catIcon, ""),
        getIconBarColumn(ArticleModelStyle.credibility, cred),
        getIconBarColumn(ArticleModelStyle.cost, cost),
      ],
    );
  }
}