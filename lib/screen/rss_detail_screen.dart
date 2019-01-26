import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter_rss/screen/item_details_screen.dart';


class RssDetailScreen extends StatefulWidget {

  RssDetailScreen({@required this.title, @required this.url});

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return _RssDetailScreenState(title:title, url:url);
  }
}

class _RssDetailScreenState extends State<RssDetailScreen> {

  final String title;
  final String url;

  List<Widget> _items = [];

  _RssDetailScreenState({
    @required this.title,
    @required this.url
  }) { getItems(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: _items,
        ),
      ),
    );
  }

  void getItems() async {
    List<Widget> list = <Widget>[];
    Response res = await get(url);
    RssFeed feed = RssFeed.parse(res.body);
    for (RssItem item in feed.items) {
      list.add(ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 24.0
          ),
        ),
        subtitle: Text(
          item.link
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ItemDetailsScreen(
                    item: item, title: title, url: url
                  )
              )
          );
        },
      ));
    }
    setState(() {
      _items = list;
    });
  }
}