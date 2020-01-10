import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _numbers;
  int _last;
  bool _isLoading;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _last = 0;
    _isLoading = false;
    _numbers = List();
    _add10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Page'),
        ),
        body: Stack(
          children: <Widget>[
            _createBody(),
            _createLoading(),
          ],
        ));
  }

/*
El itemnBuilder es una funcion que creara cada item del ListView. Su logica 
podria abtraerse en una clase Adapter por ejemplo, en donde se le pase
como parametro una lista de objetos y sea la encargada de manejarla. 
 */
  Widget _createBody() {
    ListView listView = ListView.builder(
      controller: _scrollController,
      itemCount: _numbers.length,
      itemBuilder: (BuildContext context, int index) {
        int imageID = _numbers[index];

        return Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(
                  'https://i.picsum.photos/id/$imageID/500/300.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 100),
            ),
            Divider(),
          ],
        );
      },
    );

    return RefreshIndicator(
      child: listView,
      onRefresh: _refreshPage,
    );
  }

  Future<Null> _refreshPage() async  {
    Duration duration = new Duration(seconds: 2);

    new Timer(duration, (){
      _numbers.clear();
    _last++;
    _add10();
    });


    return Future.delayed(duration);
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 16),
        ],
      );
    } else
      return Container();
  }

  void _add10() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _last++;
        _numbers.add(_last);
      }
    });
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    return Timer(Duration(seconds: 2), _HTTPRespose);
  }

  void _HTTPRespose() {
    _isLoading = false;
    _add10();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }
}
