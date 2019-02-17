import 'package:flutter/material.dart';
import 'package:know_good_news/Models/Player.dart';
import 'package:know_good_news/Models/Story.dart';
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

class _ArticlePageState extends State<ArticlePage> with TickerProviderStateMixin{
  //variables
  Card _card;
  String _budget;
  bool _canPublish = false;
  ArticleModelStyle ams = new ArticleModelStyle();
  double _headerHeight;
  double _barHeight;

  @override
  Widget build(BuildContext context) {
    _headerHeight = MediaQuery.of(context).size.height * .6;
    _barHeight = MediaQuery.of(context).size.height * .1;
    _budget = widget.player.getMoney().toString();

    Story _story = widget.player.printStory();
    Card _card = _createCard(_story);

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.player.getName()),
          actions: <Widget>[
            FlatButton(
              child: Text("Info"),
              textColor: Colors.white,
              onPressed: () => _openInfo(),
            ),
            FlatButton(
              child: Text("Publish"),
              textColor: Colors.white,
              onPressed: _canPublish? () => _handlePublish(): null,
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -5.0, 0.0),
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
              Builder(
                builder: (context) => Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: _createSwipeDetector(
                        context, _card, _story), //SwipeDetector
                      //child: positioned, //SwipeDetector
                    )
                ),
              ),
            ],
          ),
        ),
      backgroundColor: ColorDefinitions.tertiaryColor,
    );

  }

  Card _createCard(Story story) {
    return Card(
      //color: ColorDefinitions.tertiaryColor,
      margin: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: _headerHeight,
            alignment: Alignment(_headerHeight / 2, 0),
            padding: EdgeInsets.all(20),
            child: new Text(story.getHeadline(),
                style: TextStyles.titleStyle,
                textAlign: TextAlign.center

            ),
          ),
          Container(
            height: _barHeight,
            alignment: Alignment((_barHeight / 2 + _headerHeight), 0),
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

  SwipeDetector _createSwipeDetector(BuildContext context, Widget child, Story story){
    return new SwipeDetector(
        child: child,
        onSwipeLeft: () => _accept(context, story),
        onSwipeRight: () => _reject(story),
    );
  }

  void _accept(BuildContext context, Story story){
    print("accept article");
    String msg = "";
    int numArticles = widget.player.swipe(true, story);
    if (numArticles != -1) { //Added correctly?
      setState(() { //update with new budget and get next article
        _budget = widget.player.getMoney().toString();
        _card = _createCard(widget.player.printStory());
      });
      if( numArticles ==  0) { // paper has been cleared = published
        setState(() { //update with new budget and get next article
          _canPublish = false;
        });
        //msg = "Paper Published! Congrats";
        showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Paper Published!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('New Readers: ' + widget.player.company.lastAddReaders.toString()),
                    Text('Profit: ' + widget.player.company.lastProfit.toString()),
                    Text('Credibility Inc: ' + widget.player.company.lastCredInc.toString()),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cool'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      } else if (numArticles == 5){ // min num reached, enable publish button
        setState(() {
          _canPublish = true;
        });
        msg = "You can now publish";

      } else {
          msg = "Article Added ("+numArticles.toString()+")";
      }

    } else {  //something went wrong/can't afford
      msg = "You couldn't afford that";
    }

    if(msg.length != 0) {
      Scaffold.of(context).showSnackBar(
          new SnackBar(
              content: Text(msg),
              duration: Duration(milliseconds: 500)
          )
      );
    }
  }

  /*
   * Update player's company and notify user
   */
  void _reject(Story story){
    print("reject article");
    widget.player.swipe(false, story);

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

  void _openInfo(){
    //TODO send player to info page
  }
}