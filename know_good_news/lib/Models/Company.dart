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

  List<Story> issue;

  int cred;
  int turn;
  Player player;

  Random rnd = new Random();

  Company(this.player) {
    this.scores.putIfAbsent(Category.food, () => 0);
    this.scores.putIfAbsent(Category.tech, () => 0);
    this.scores.putIfAbsent(Category.sports, () => 0);
    this.scores.putIfAbsent(Category.science, () => 0);
    this.scores.putIfAbsent(Category.politics, () => 0);
    this.scores.putIfAbsent(Category.health, () => 0);

    this.paperType = Category.values[rnd.nextInt(5)];

    this.turn  = 0;
    this.cred = 50;

    for (int i; i < 5; i ++) {
      this.authors.add(new Author.automatic());
    }

    this.authors.forEach((author) => author.hire());

    for (int i; i < 30; i ++) {
      this.readers.add(new Reader());
    }

    List<Story> tempStories;
    authors.forEach((author) => tempStories.add(new Story(author, this.paperType)));
  }

  bool reactToStory(Reader reader, List<Story> stories) {
    int response;
    stories.forEach((story) => response +=(reader.react(story)));

    if (response >= 5){
      return true;
    } else {
      return false;
    }
  }

  void submitStory() {
    List<Reader> toRemove;
    List<Reader> toAdd;

    for (int i = 0; i < readers.length; i++){
      if (!reactToStory(readers[i], issue)) {
        toRemove.add(readers[i]);
      } else {
        if (rnd.nextInt(2) == 0){
          toAdd.add(new Reader.recruit(readers[i]));
        }
      }
    }

    //change credibility
    int tempCred;
    issue.forEach((story) => tempCred += story.cred);
    tempCred ~/= issue.length;

    cred = (cred + tempCred)~/2;

    //change readers
    toRemove.forEach((removal) => readers.remove(removal));
    readers += toAdd;

    //add profits depending on readership
    player.addCash((readers.length * .05 * cred).toInt());

    //set turn value of lists to profits and popularity
    profits.add(5); //adds a temp standin for profits -- get current budget from player for profit.
    popularity.add(readers.length);

    turn += 1;

    //givenStories.removeRange(0, givenStories.length - 1);
    issue.removeRange(0, issue.length - 1);

    List<Story> tempStories;
    authors.forEach((author) => tempStories.add(new Story(author, this.paperType)));
    player.newStories(tempStories);
    //authors.forEach((author) => givenStories.add(new Story(author, this.paperType)));
  }

  void swipe(bool direction, Story story) {
    if (direction) {
      issue.add(story);

      if (issue.length > 10) {
        submitStory();
      }
    } else {
      //do nothing. I guess???
    }
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