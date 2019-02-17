import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';
import 'package:html/parser_console.dart';
import 'dart:convert' as JSON;
import 'dart:math';
import 'Category.dart';

class HTTPServer {
  Future run(Category cat) async {
    //String keys = "Science";

    Random rnd = new Random();

    print('https://newsapi.org/v2/top-headlines?q=' + cat.toString() + '&apiKey=504440fedb62484ab6632c8748373296');
    Map obj = JSON.jsonDecode(await HttpRequest.getString('https://newsapi.org/v2/top-headlines?q=' + cat.toString() + '&apiKey=504440fedb62484ab6632c8748373296'));

    int index = (rnd.nextInt(obj['totalResults']));
    //print (index);
    return await (obj['articles'][index]['title'].toString());
    //print(obj);
  }
}