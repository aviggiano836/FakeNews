import 'Author.dart';
import 'Reader.dart';
import 'Story.dart';
import 'Category.dart';
import 'Player.dart';
import 'dart:math';

class Company {
  Category paperType;
  Map<Category, int> scores;

  List<Author> authors;
  List<Reader> readers;

  List<int> profits;
  List<int> popularity;

  int lastProfit;
  int lastAddReaders;
  int lastCredInc;

  List<Story> issue;

  int cred;
  int turn;
  Player player;

  Random rnd = new Random();

  Company(this.player) {
    this.scores = {Category.food: 0, Category.tech: 0, Category.health: 0, Category.politics: 0, Category.sports: 0, Category.science: 0};

    this.issue = new List<Story>();
    /*
    this.scores.putIfAbsent(Category.food, () => 0);
    this.scores.putIfAbsent(Category.tech, () => 0);
    this.scores.putIfAbsent(Category.sports, () => 0);
    this.scores.putIfAbsent(Category.science, () => 0);
    this.scores.putIfAbsent(Category.politics, () => 0);
    this.scores.putIfAbsent(Category.health, () => 0);
    */

    this.paperType = Category.values[rnd.nextInt(5)];

    this.turn  = 0;
    this.cred = 50;

    this.authors = new List<Author>();

    for (int i = 0; i < 5; i ++) {
      this.authors.add(new Author.automatic());
    }

    this.authors.forEach((author) => author.hire());

    this.readers = new List<Reader>();

    for (int i = 0; i < 30; i ++) {
      this.readers.add(new Reader());
    }

    List<Story> tempStories = new List<Story>();
    authors.forEach((author) => tempStories.add(new Story(author, this.paperType)));
    player.newStories(tempStories);
  }

  bool reactToStory(Reader reader, List<Story> stories) {
    int response = 0;
    stories.forEach((story) => response +=(reader.react(story)));

    if (response >= 5){
      return true;
    } else {
      return false;
    }
  }

  void submitStory() {
    List<Reader> toRemove = new List<Reader>();
    List<Reader> toAdd = new List<Reader>();

    for (int i = 0; i < readers.length; i++){
      if (!reactToStory(readers[i], issue)) {
        toRemove.add(readers[i]);
      } else {
        if (rnd.nextInt(2) == 0){
          toAdd.add(new Reader.recruit(readers[i]));
        }
      }
    }
    lastAddReaders = toAdd.length - toRemove.length;

    //change credibility
    int tempCred = 0;
    issue.forEach((story) => tempCred += story.cred);
    tempCred ~/= issue.length;
    lastCredInc = tempCred;


    cred = (cred + tempCred)~/2;

    //change readers
    toRemove.forEach((removal) => readers.remove(removal));
    readers += toAdd;

    //add profits depending on readership
    lastProfit = (readers.length * .1 * cred).toInt();
    player.addCash(lastProfit);

    //set turn value of lists to profits and popularity
    if(profits == null){
      profits = new List<int>();
    }
    profits.add(player.budget); //adds a temp standin for profits -- get current budget from player for profit.

    if(popularity == null){
      popularity = new List<int>();
    }
    popularity.add(readers.length);

    turn += 1;

    //givenStories.removeRange(0, givenStories.length - 1);
    issue.clear();

    List<Story> tempStories = new List<Story>();
    authors.forEach((author) => tempStories.add(new Story(author, this.paperType)));
    player.newStories(tempStories);
    //authors.forEach((author) => givenStories.add(new Story(author, this.paperType)));
  }

  int swipe(bool direction, Story story) {
    if (direction) {
      issue.add(story);

      if (issue.length == 8) {
        submitStory();
      }

      return this.issue.length;
    }

    return -1;
  }

  /*
  void swipeGiven(bool direction, int index) {
    if (direction) {
      issue.add(givenStories[index]);

      if (issue.length > 10) {
        submitStory();
      }
    } else {
      //do nothing. I guess???
    }
  }

  void swipeNew(bool direction, Story story) {
    if (direction) {
      issue.add(story);

      if (issue.length > 10) {
        submitStory();
      }
    } else {
      //do nothing. I guess???
    }
  }
  */
}