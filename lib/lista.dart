import 'package:appuern/itens.dart';
import 'package:flutter/material.dart';

import 'cadastro.dart';

class ListPage extends StatefulWidget {
  var lista_material = new List<Item>();
  ListPage() {
    lista_material = [];
    lista_material.add(Item(
        nomeUser: "Raul",
        material: "Projetor",
        dia: "01/10/2019",
        id: "1",
        done: false));
    lista_material.add(Item(
        nomeUser: "Raul",
        material: "Kit Piloto e Apagador",
        dia: "07/10/2019",
        id: "2",
        done: false));
    lista_material.add(Item(
        nomeUser: "Alberto",
        material: "Projetor",
        dia: "09/10/2019",
        id: "3",
        done: false));
  }
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Emprestimos"),
      ),
      body: ListView.builder(
        itemCount: widget.lista_material.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.lista_material[index];
          return CheckboxListTile(
            title: Text(item.material),
            subtitle: Text(item.nomeUser),
            key: Key(item.id),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CadastroPage()));
        },
        label: Text('Adicionar'),
        icon: Icon(Icons.add_box),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
