import 'Author.dart';
import 'Reader.dart';
import 'Story.dart';
import 'Category.dart';
import 'Company.dart';
import 'dart:math';

class Player {
  Company company;

  Player() {
    company = new Company(this);
  }
}