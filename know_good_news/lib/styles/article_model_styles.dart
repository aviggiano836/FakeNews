import 'package:flutter/material.dart';
import 'package:know_good_news/Models/Category.dart';
enum ArticleCategory{
  SCIENCE, POLITICS, SPORTS, FOOD, HEALTH, TECH
}

class ArticleModelStyle{
  static const Icon credibility = const Icon(IconData(0xe24e, fontFamily: 'MaterialIcons'));
  static const Icon cost = const Icon(IconData(0xe227, fontFamily: 'MaterialIcons'));

  //Article categories
  static const Icon science = const Icon(IconData(0xe90f, fontFamily: 'MaterialIcons'));
  static const Icon politics = const Icon(IconData(0xe90e, fontFamily: 'MaterialIcons'));
  static const Icon health = const Icon(IconData(0xe3f3, fontFamily: 'MaterialIcons'));
  static const Icon sports = const Icon(IconData(0xeb43, fontFamily: 'MaterialIcons')); //barbell: 0xeb43, running: 0xe566
  static const Icon food = const Icon(IconData(0xe57a, fontFamily: 'MaterialIcons'));
  static const Icon tech = const Icon(IconData(0xe322, fontFamily: 'MaterialIcons'));

  Icon getIconFromCat(Category cat){
    switch(cat){
      case Category.food:{ return food; }
      break;

      case Category.health:{ return health; }
      break;

      case Category.politics: { return politics; }
      break;

      case Category.science: { return science; }
      break;

      case Category.sports: { return sports; }
      break;

      case Category.tech: { return sports; }
      break;

      default: { return null; }
      break;
    }
  }
}