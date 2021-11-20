import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Criando uma variavel global
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  _renderBackground() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
    );
  }

  //  Renderização do card
  _renderCard(BuildContext context) {
    // Renderizar o cartão - back e front
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 100.0),
      color: Colors.white,
      child: _renderFlipCard()
    );
  }

  _renderFlipCard() {
    return FlipCard(
        key: _cardKey,
        flipOnTouch: true, // Virar no toque
        direction: FlipDirection.HORIZONTAL, // Direção: horizontal ou vertical
        speed: 1000, // Velocidade em milisegundos
        onFlipDone: (status) => print('status $status'),
        front: _renderFront(), // Renderizando a parte da frente do card
        back: _renderBack() // Renderizando a parte de trás do card
    );
  }

  _renderBack() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade300,
        borderRadius: BorderRadius.circular(12.5)
      ),
      child: Center(
        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeDrWfslYhDtHM5hrxNAQpo9p0ib3mxWE5NQ&usqp=CAU'),
        ),
      );
  }

  _renderFront() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.5)
      ),
      child: Center(
        child: Text(
            'Press on button',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.5,
              letterSpacing: 5.1
            ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flip Card'),),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
        Column(
          children: [
            Expanded(
                child: _renderCard(context),
            )
          ],
        )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cardKey.currentState!.toggleCard(),
        splashColor: Colors.indigo,
        autofocus: true,
        tooltip: 'Press',
        child: Icon(Icons.add),
      ),
    );
  }

}
