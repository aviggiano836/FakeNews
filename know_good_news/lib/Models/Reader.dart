import 'Category.dart';
import 'dart:math';
import 'Story.dart';

class Reader
{
  Category interest;
  int cred;

  Random rnd = new Random();

  Reader() {
    this.interest = Category.values[rnd.nextInt(5)];
    this.cred = rnd.nextInt(100);
  }

  Reader.recruit(Reader reader) {
    this.interest = reader.interest;
    this.cred = reader.cred + (rnd.nextInt(10) - 5);

    if (this.cred > 100) {
      this.cred = 100;
    } else if (this.cred < 0){
      this.cred = 0;
    }
  }

  int react(Story story) {
    if (story.subject == interest) {
      if (story.cred < (this.cred - 50)) {
        return 0;
      }

      return 1;
    } else {
      if (story.cred < (this.cred - 30)) {
        return 0;
      }

      return 1;
    }
  }
}