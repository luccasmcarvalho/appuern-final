import 'package:appuern/cadastro.dart';
import 'package:appuern/lista.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UERN Empresta',
      theme: ThemeData(
        primarySwatch: Colors.greenAccent[300],
      ),
      home: MyHomePage(title: 'UERN EMPRESTA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final _senha = new TextEditingController();
    final _user = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: _user,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "Matricula",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: _senha,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              Divider(),
              Divider(),
              ButtonTheme(
                height: 40,
                child: RaisedButton(
                  onPressed: (){
                    RegExp validUser = new RegExp(r"[0-9]");
                    RegExp validSenha = new RegExp (r"[0-9]");
                    RegExp validAdm = new RegExp(r"[adm][0-9]");
                    Iterable<Match> match1 = validSenha.allMatches(_senha.text);
                    Iterable<Match> match2 = validUser.allMatches(_user.text);
                    Iterable<Match> match3 = validAdm.allMatches(_senha.text);

                    if (match1.length == 0 || match2.length == 0 ){
                     Alert(context: context, title:"Informe o user e senha").show();
                    }
                    else{
                      if (match3 != match1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPage(),
                    ));
                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CadastroPage(),
                    )); 
                      }
                    }
                  },
                  child: Text(
                    "Logar",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}