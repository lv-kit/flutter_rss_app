import 'package:flutter/material.dart';
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

  Widget _widget = Text('wait...');
  _ItemDetailScreenState({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: _widget,
    );
  }
}