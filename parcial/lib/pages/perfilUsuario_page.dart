import 'package:flutter/material.dart';

class PerfilUsuarioPage extends StatelessWidget {
  static String id = 'PerfilUsuario_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          Positioned(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Caja1(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 230,
            child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: Column(
                        children: [
                          Container(
                            child: Text("PERFIL DE USUARIO",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 12),
                          UserName(),
                          SizedBox(height: 12),
                          Email(),
                          SizedBox(height: 12),
                          Phone(),
                          SizedBox(height: 12),
                          Fecha(),
                          SizedBox(height: 12),
                          Sexo(),
                          SizedBox(height: 12),
                          Guardar(),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class Guardar extends StatefulWidget {
  @override
  _GuardarState createState() => _GuardarState();
}

class _GuardarState extends State<Guardar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple.shade600,
            borderRadius: BorderRadius.circular(30)),
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Center(
          child: Text(
            'Guardar',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Sexo extends StatefulWidget {
  @override
  _SexoState createState() => _SexoState();
}

class _SexoState extends State<Sexo> {
  bool state1 = false;
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Sexo',
              style: TextStyle(fontSize: 15, color: Colors.purple.shade600),
            ),
          ),
          Row(
            children: [
              Switch(
                value: state1,
                onChanged: (bool s) {
                  setState(() {
                    state1 = s;
                    print(state1);
                  });
                },
              ),
              Container(
                child: Text("Hombre"),
              ),
              Switch(
                value: state2,
                onChanged: (bool s) {
                  setState(() {
                    state2 = s;
                    print(state2);
                  });
                },
              ),
              Container(
                child: Text("Mujer"),
              )
            ],
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
class Fecha extends StatefulWidget {
  @override
  _FechaState createState() => _FechaState();
}

class _FechaState extends State<Fecha> {
  String _fecha = '';
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Fecha de Nacimiento',
              style: TextStyle(fontSize: 15, color: Colors.purple.shade600),
            ),
          ),
          Container(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Colors.purple.shade600,
                  ),
                  hintText: 'Fecha de Nacimiento',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _selectDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime(2022),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {});
      _fecha = date.toString();
      _textController.text = _fecha;
    }
  }
}

///////////////////////////////////////////////////
class Phone extends StatefulWidget {
  @override
  _Phone createState() => _Phone();
}

class _Phone extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Numero de celular',
              style: TextStyle(fontSize: 15, color: Colors.purple.shade600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 1)]),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mobile_friendly,
                    color: Colors.purple.shade600,
                  ),
                  hintText: 'Numero de Celular',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////
class Email extends StatefulWidget {
  @override
  _Email createState() => _Email();
}

class _Email extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Email',
              style: TextStyle(fontSize: 15, color: Colors.purple.shade600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 1)]),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.attach_email,
                    color: Colors.purple.shade600,
                  ),
                  hintText: 'Email',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////
class UserName extends StatefulWidget {
  @override
  _UserName createState() => _UserName();
}

class _UserName extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Nombre de Usuario',
              style: TextStyle(fontSize: 15, color: Colors.purple.shade600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 1)]),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.purple.shade600,
                  ),
                  hintText: 'Nombre de Usuario',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////
class Caja1 extends StatefulWidget {
  @override
  _Caja1 createState() => _Caja1();
}

class _Caja1 extends State<Caja1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.pink.shade700, Colors.purple.shade600],
            stops: [0.1, 0.5],
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomRight),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: AssetImage('images/perfil3.jpg'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Luis Lunarejo Aponte",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  child: Icon(Icons.edit_road_sharp),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 1)
                      ]))
            ],
          ))
        ],
      ),
    );
  }
}
