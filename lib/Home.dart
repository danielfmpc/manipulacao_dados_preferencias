import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  String textoSalvo = "nada Salvo";
  _salvar() async {
    String valorDigitado = _controller.text;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("nome", valorDigitado);
    
  }
  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      textoSalvo = prefs.getString("nome") ?? "sem valor";
    });
  }
  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(textoSalvo),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo",
              ),
              controller: _controller,              
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: _salvar(),
                  child: Text("Salvar", style: TextStyle(color: Colors.white),),
                  color: Colors.green,            
                ),
                RaisedButton(
                  onPressed: _recuperar(),
                  child: Text("ler", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,            
                ),
                RaisedButton(
                  onPressed: _remover(),
                  child: Text("remover", style: TextStyle(color: Colors.white),),
                  color: Colors.red,            
                ),
              ],
            )          
          ],
        ),
      ),
    );
  }
}