import 'dart:io';

import 'package:flutter/material.dart';
import 'package:know_good_news/Models/Player.dart';
import 'package:know_good_news/Models/Story.dart';
import 'package:know_good_news/styles/button_themes.dart';
import 'package:know_good_news/styles/color_styles.dart';
import 'package:know_good_news/styles/text_styles.dart';
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
  Story _story;
  String _budget;
  bool _canPublish = false;
  ArticleModelStyle ams = new ArticleModelStyle();
  double _headerHeight;
  double _iconBarHeight;

  Card _createCard(Story story){
    _story = story;
    return Card(
      //color: ColorDefinitions.tertiaryColor,
      margin: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: _headerHeight,
            alignment: Alignment(_headerHeight/2, 0),
            padding: EdgeInsets.all(20),
            child: new Text(story.getHeadline(),
              style: TextStyles.titleStyle,
              textAlign: TextAlign.center

            ),
          ),
          Container(
            height: _iconBarHeight,
            alignment: Alignment((_iconBarHeight/2 + _headerHeight), 0),
            child: getIconBar(
                ams.getIconFromCat(story.getCat()),
                story.getCred().toString(),
                story.getCost().toString()
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _headerHeight = MediaQuery.of(context).size.height * .6;
    _iconBarHeight = MediaQuery.of(context).size.height * .1;
    _budget = widget.player.getMoney().toString();

    _card = _createCard(widget.player.printStory());
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.player.getName()),
          /*actions: <Widget>[ TODO add user publishing when min reached
            FlatButton(
              child: Text("Publish"),
              textColor: Colors.white,
              onPressed: _canPublish? () => {_handlePublish} : null, //TODO
            )
          ],*/
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                color: ColorDefinitions.primaryAccentColor,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top:0),
                child: getIconBar(
                    ams.getIconFromCat(
                      widget.player.getType()
                    ),
                    widget.player.getCred().toString(),
                    _budget.toString()
                ),
              ),

              createSwipeDetector(context, _card ), //SwipeDetector
            ],
          ),
        ),
      backgroundColor: ColorDefinitions.tertiaryColor,
    );

  }

  SwipeDetector createSwipeDetector(BuildContext context, Widget child){
    return new SwipeDetector(
        child: child,
        onSwipeLeft: () => _accept(context),
        onSwipeRight: _reject,
    );
  }

  void _accept(BuildContext context){
    print("accept article");
    //update story
    int numArticles = widget.player.swipe(true, _story);
    if (numArticles != -1) {
      setState(() {
        _budget = widget.player.getMoney().toString();
        _card = _createCard(widget.player.printStory());
        if( numArticles ==  10) {
          //published, send feedback
          Scaffold.of(context).showSnackBar(
              new SnackBar(
                  content: Text("Paper Published! Congrats"),
                  duration: Duration(seconds: 3)
              )
          );
        }/* else if (numArticles == 5){ //TODO, min reached, enable publish btn
          setState(() {
            _canPublish = true;
          });
        }*/ else {
          //something went wrong/can't afford
          Scaffold.of(context).showSnackBar(
              new SnackBar(
                  content: Text("You couldn't afford that"),
                  duration: Duration(seconds: 3)
              )
          );
        }
      });

    } else {

    }
  }

  void _reject(){
    print("reject article");
    //update story
    widget.player.swipe(false, _story);
    setState(() {
      _card = _createCard(widget.player.printStory());
    });
  }

  void _handlePublish(){
    //TODO allow user to init publishing
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        getIconBarColumn(catIcon, ""),
        getIconBarColumn(ArticleModelStyle.credibility, cred),
        getIconBarColumn(ArticleModelStyle.cost, cost),
      ],
    );
  }
}