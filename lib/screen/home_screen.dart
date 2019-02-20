import 'package:flutter/material.dart';
import 'package:flutter_rss/screen/rss_detail_screen.dart';


class HomeScreen extends StatelessWidget {
  final List<String> names = [
    '主要ニュース',
    '国際情勢',
    '国内の出来事',
    'IT関係'
  ];

  final List<String> links = [
    'https://news.yahoo.co.jp/pickup/rss.xml',
    'https://news.yahoo.co.jp/pickup/world/rss.xml',
    'https://news.yahoo.co.jp/pickup/domestic/rss.xml',
    'https://news.yahoo.co.jp/pickup/computer/rss.xml',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yahoo Checker'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: items(context),
        ),
      ),
    );
  }

  List<Widget> items(BuildContext context) {
    List<Widget> items = [];
    for(var i = 0;i < names.length;i++) {
      items.add(
        ListTile(
          contentPadding: EdgeInsets.all(10.0),
          title: Text(names[i],
            style: TextStyle(fontSize: 24.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RssDetailScreen(
                      title: names[i],
                      url: links[i]
                    )
                )
            );
          },
        )
      );
    }
    return items;
  }
}