import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uts_app1/auth.dart';
import 'package:flutter/material.dart';
import 'package:uts_app1/pages/about.dart';
import 'package:uts_app1/pages/add.dart';
import 'package:uts_app1/pages/news.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('APP SAHRUL');
  }

  Widget _nama() {
    return Text(
      "Hi, Selamat Datang di Halaman Dashboard",
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: signOut,
                child: Text("Logout"),
              )
            ];
          })
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _nama(),
            _userUid(),
            Card(
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.home,
                        size: 70,
                        color: Colors.blueAccent,
                      ),
                      Text("Home", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsPage()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.newspaper,
                        size: 70,
                        color: Colors.redAccent,
                      ),
                      Text("Berita", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InsertData()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.greenAccent,
                      ),
                      Text("Data Tamu", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tentang()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.bookmark,
                        size: 70,
                        color: Colors.blueGrey,
                      ),
                      Text("Tentang", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
