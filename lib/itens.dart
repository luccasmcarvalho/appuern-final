class Item {
  String nomeUser;
  String material;
  String dia;
  String id;
  bool done;
  Item ({this.nomeUser,this.material,this.dia, this.id, this.done});

  Item.fromJson(Map<String, dynamic> json){
    nomeUser = json['nomeuser'];
    material = json['material'];
    dia      = json['dia'];
    id       = json['id'];
    done     = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic> ();
    data['nomeuser'] = this.nomeUser;
    data['mateial']  = this.material;
    data['dia']      = this.dia;
    data['id']       = this.id;
    data['done']     = this.done;
  }
}