import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Soy el titulo de esta tarjeta'),
            leading: Icon(Icons.access_alarm),
            subtitle: Text(
                'Yo soy el texto de la tarjeta jajaja no digo nada de nada'),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  // Una forma de imitar una tarjeta mediante contenedores
  Widget _cardType2() {
    var card = Container(
      // clipBehavior: Clip
      //     .antiAlias, //hace que nada de lo que esta dentro de la tarjeta supere sus bordes
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      // elevation: 10.0,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDkMINSJiNcMbcFVbKcgwaSkm4lVfkaFWMrQ_6zZE3lPCBW8fk'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.fill,
          ),
          Container(
            child: Text('No se que poner aqui'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 10.0,
                spreadRadius: 2.0,
                color: Colors.black26,
                offset: Offset(2.0, 10.0),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: card,
        ));
  }
}
