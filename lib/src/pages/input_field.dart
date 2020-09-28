import 'package:flutter/material.dart';

class InputFieldPage extends StatefulWidget {
  @override
  _InputFieldPageState createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  
  List <String> _poderes = ['Volar', 'Super fuerza','super velocidad'];
  
  String _nombre = '';
  String _mail = ' ';

  TextEditingController inputDateController = new TextEditingController();
  String _opcionSeleccionada = 'Volar';  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Fields'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        children: [
          _mostrarPersona(),
          SizedBox(height: 25,),
          _mostrarMail(),
          SizedBox(height: 25,),
          _mostrarPassword(),
          SizedBox(height: 25,),
          _mostrarNacimiento(),
          SizedBox(height: 25,),
          _mostrarPoderes(),
          SizedBox(height: 40,),
          Divider(),
          _mostrarDatos(),
        ],
      ),
    );
  }

  Widget _mostrarPersona() {
    return TextField(
      decoration: InputDecoration(
        counter: Text('Letras 0'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.account_circle),
        icon: Icon(Icons.accessibility),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (value){
        setState(() {
          _nombre = value;
        });
      },
    );
  }
  
  Widget _mostrarMail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Mail',
        labelText: 'Mail',
        suffixIcon: Icon(Icons.mail),
        icon: Icon(Icons.mail_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (value){
        setState(() {
          _mail = value;
        });
      },
    );
  }

  Widget _mostrarPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        labelText: 'password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_open),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
  
  Widget _mostrarNacimiento() {
    return TextField(
      controller: inputDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.perm_contact_calendar),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _mostrarDatos() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Correo: $_mail'),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime datePicker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2022),
      locale: new Locale('es'),
    );

    if (datePicker != null){
      final fecha = datePicker.toString();
      inputDateController.text = fecha;
    }
  }

  List <DropdownMenuItem<String>> getOpcionesDropDown(){
    List <DropdownMenuItem<String>> _lista = [];

    _poderes.forEach((element) {
      _lista.add(
        DropdownMenuItem(
          child: Text(element),
          value: element,
        ),
      );
    });

    return _lista;
  }

  Widget _mostrarPoderes() {
    return Container(
      child: Row(
        children: [
          Icon(Icons.perm_identity),
          Expanded(child: SizedBox(width: 10,)),
          DropdownButton(
            items: getOpcionesDropDown(),
            value: _opcionSeleccionada,
            onChanged: (value){
              setState(() {
                _opcionSeleccionada = value;
              });
            },
          ),
        ],
      ),
    );
  }



}