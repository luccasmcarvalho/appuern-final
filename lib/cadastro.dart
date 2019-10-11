import 'package:flutter/material.dart';

import 'itens.dart';
import 'lista.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}




class _CadastroPageState extends State<CadastroPage> {
  final _nomeUser = new TextEditingController();
    final _material = new TextEditingController();
    final _dia = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Cadastro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _nomeUser,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "Informe seu Nome",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                controller: _material,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "Informe o Material que irá ser reservado",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.datetime,
                controller: _dia,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "Informe o dia a ser reservado",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              ],            
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var lista = new List<Item>();
          lista.add(Item(
        nomeUser: ("$_nomeUser"),
        material: ("$_material"),
        dia: ("$_dia"),
        done: false));
        
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListPage()));
        },
        label: Text('Enviar'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
