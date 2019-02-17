import 'package:flutter/material.dart';
import 'package:know_good_news/styles/color_styles.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key key, this.title, this.firstVisit}) : super(key: key);

  final String title;
  final bool firstVisit;

  @override
  _ArticlePageState createState() => _ArticlePageState();

}

class _ArticlePageState extends State<ArticlePage>{
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
              Container(
                color: ColorDefinitions.backgroundColor,
                width: MediaQuery.of(context).size.width * .9,
                //height: MediaQuery.of(context).size.height * .8,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    new Text("Scientists Hack Plant DNA",
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

}