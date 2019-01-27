import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';


class ItemDetailsScreen extends StatefulWidget {

  final String title;
  final String url;
  final RssItem item;

  ItemDetailsScreen({
    @required this.title,
    @required this.url,
    @required this.item
});

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailScreenState(item: item);
  }
}


class _ItemDetailScreenState extends State<ItemDetailsScreen> {
  RssItem item;

  Widget _widget = Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
    ),
  );
  _ItemDetailScreenState({@required this.item});

  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: _widget,
    );
  }

  void getItem() async {
    Response res = await get(item.link);
    dom.Document doc = dom.Document.html(res.body);
    print(doc);
    dom.Element hBody = doc.querySelector('.hbody');
    print(hBody.text);
    dom.Element hTitle = doc.querySelector('.newsTitle a');
    print(hTitle.text);
    dom.Element newsLink = doc.querySelector('.newsLink');
    print(newsLink.attributes['href']);
    setState(() {
      _widget = SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                child: Text(
                  hTitle.text,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                child: Text(
                  hBody.text,
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text('続きを読む...',
                    style: TextStyle(fontSize: 18.0),
                  ),
                    onPressed: () {
                      launch(newsLink.attributes['href']);
                    }
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}