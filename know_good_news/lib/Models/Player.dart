import 'Author.dart';
import 'Reader.dart';
import 'Story.dart';
import 'Category.dart';
import 'Company.dart';
import 'dart:math';

class Player {
  Company company;
  String name;
  int budget;
  List<Story> stories;

  Player(this.name) {
    company = new Company(this);
    budget = 50;
  }

  void swipe(bool direction, Story story) {
    if (direction) {
      if (story.cost > budget) {
        //print you don't have enough money for this story
      } else {
        budget -= story.cost;
        company.swipe(true, story);
      }
    } else {
      //progress to the next story
    }
  }

  void newStories(List<Story> stories) {
    this.stories = stories;
  }

  void addCash(int money) {
    budget += money;
  }

  String getName() {
    return this.name;
  }

  int getMoney() {
    return this.budget;
  }

  Story printStory() {
    if (stories.length == 0) {
      return new Story.automatic();
    } else {
      Story story = stories[0];
      stories.removeAt(0);

      return story;
    }
  }

  Category getType() {
    return company.paperType;
  }

  Map<Category, int> getScores() {
    return company.scores;
  }

  List<Author> getAuthors() {
    return company.authors;
  }

  List<int> getProfits() {
    return company.profits;
  }

  List<int> getPopularity() {
    return company.popularity;
  }

  void hireAuthor(Author author) {
    company.authors.add(author);
  }

  void fireAuthor(Author author) {
    company.authors.remove(author);
  }

}