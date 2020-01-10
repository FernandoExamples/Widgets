import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
            ),
            margin: EdgeInsets.only(right: 10.0),
          ),
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcScWvjgQj0rdUnFr4uXlxpP78yNxg2aD6SbC4xQLTAhbphCJT8Z'),
              radius: 22.0,
            ),
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(5.0),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT2EtadMyjIyUtnXUrnj_vrDqCX7eMZir4-ZWkeHAzqxbutHkIV'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
