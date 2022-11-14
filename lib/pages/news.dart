import 'dart:convert';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uts_app1/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData(
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=17f41e981a414082b040d164a27e981b");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita Artikel"),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey,
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(
                      _posts[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {},
          );
        },
      ),
    );
  }

  Future _getData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
