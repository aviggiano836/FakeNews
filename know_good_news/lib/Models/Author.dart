import 'Category.dart';
import 'dart:math';

class Author
{
  String name;
  int cred, minPrice, maxPrice;
  Category cat1;
  Category cat2;
  Category cat3;

  Random rnd = new Random();

  Author (this.name, this.cred, this.minPrice, this.maxPrice, this.cat1, this.cat2, this.cat3);

  Author.automatic ()
  {
    name = "Anon Nymous";

    this.cat1 = Category.values[rnd.nextInt(5)];
    this.cat2 = Category.values[rnd.nextInt(5)];
    this.cat3 = Category.values[rnd.nextInt(5)];

    minPrice = rnd.nextInt(30) + 1;
    maxPrice = minPrice + rnd.nextInt(70) + 1;
  }

  void hire() {
    minPrice ~/= 10;
    maxPrice ~/= 10;
  }

  String getName() {
    return name;
  }

  int getCredibility() {
    return cred;
  }

  Category getCategory() {
    return cat1;
  }

  int getPrice() {
    return minPrice + (rnd.nextInt(maxPrice - minPrice) + 1);
  }

  int getCatScore(Category cat) {
    if (cat1 == cat) {
      return 0;
    } else if (cat2 == cat) {
      return 1;
    } else if (cat3 == cat) {
      return 2;
    } else {
      return 3;
    }
  }

  Category pickCat() {
    int x = rnd.nextInt(5);

    if (x > 2) {
      return cat1;
    } else if (x > 0) {
      return cat2;
    } else {
      return cat3;
    }
  }

  void printReport() {
    print("My name is " + name + " and I cost " + (minPrice + rnd.nextInt(maxPrice - minPrice)).toString() + " today. My credibility score is " + cred.toString() + "%.");
  }
}