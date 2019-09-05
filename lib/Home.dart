import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Texto"),
            TextField(
              keyboardType: TextInputType.text,
              controller: _controller,              
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: null,
                  child: Text("Salvar", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,            
                ),
                RaisedButton(
                  onPressed: null,
                  child: Text("ler", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,            
                ),
              ],
            )          
          ],
        ),
      ),
    );
  }
}