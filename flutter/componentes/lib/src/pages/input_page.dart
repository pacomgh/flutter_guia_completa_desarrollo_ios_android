import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  //InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre="";
  String _email="";
  String _password="";
  String _fecha = "";
  String _opcionSeleccionada = 'Volar';//le damos un valor de la lista para que aparezca por defecto
  //controlador para relacionar la fecha con la caja de texto
  TextEditingController _inputFieldDateController = new TextEditingController();
  //creamos una lista para el menulistitem del dropdown
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(//elegimos listview porque al escribir se desplaza con el teclado
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0,),
        children: <Widget>[
          _crearInput(),          
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(//trabaja de manera independiente al textformfield
      //autofocus: true,//le hace focus cuando entramos a la pagina
      textCapitalization: TextCapitalization.sentences,//capitaliza cada palabra
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),//contador de caracteres
        hintText: 'Nombre de la persona',//texto de sugerencia 
        labelText: 'Nombre',//etiqueta del input
        helperText: 'Solo es el nombre',//texto de ayuda para llenar input
        suffixIcon: Icon(Icons.accessibility),//icono que aparece dentro del input
        icon: Icon(Icons.account_circle),//icono del input text, a la izq        
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;          
        });
      },
    );

  }

  Widget _crearEmail() {
    return TextField(//trabaja de manera independiente al textformfield
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email',//texto de sugerencia 
        labelText: 'Email',//etiqueta del input
        suffixIcon: Icon(Icons.alternate_email),//icono que aparece dentro del input
        icon: Icon(Icons.email),//icono del input text, a la izq        
      ),
      onChanged: (valor) => setState(() {
          _email = valor;          
      })    
    );
  }

  Widget _crearPassword(){
    return TextField(//trabaja de manera independiente al textformfield
      obscureText: true,
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',//texto de sugerencia 
        labelText: 'Password',//etiqueta del input
        suffixIcon: Icon(Icons.lock_open),//icono que aparece dentro del input
        icon: Icon(Icons.lock),//icono del input text, a la izq        
      ),
      onChanged: (valor) => setState(() {
          _email = valor;          
      })    
    );
  }

  Widget _crearFecha(BuildContext context){

    return TextField(//trabaja de manera independiente al textformfield
      enableInteractiveSelection: false,//no podra copiar nada del textfield
      controller: _inputFieldDateController,
      decoration: InputDecoration(//para editar el diseño del input
        border: OutlineInputBorder(//cambia a una caja redondeada
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',//texto de sugerencia 
        labelText: 'Fecha de nacimiento',//etiqueta del input
        suffixIcon: Icon(Icons.perm_contact_calendar),//icono que aparece dentro del input
        icon: Icon(Icons.calendar_today),//icono del input text, a la izq        
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());//quitamos el foco de la fecha
        _selectDate(context);//llamamos el metodo de seleccion de fecha
      },   
    );

  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,//para saber en que espacio va a colocar el modal
      initialDate: new DateTime.now(), //la fecha inicial que muestra el calendario
      firstDate: new DateTime(2018),//el año minimo que acepta
      lastDate: new DateTime(2025), //el año maximo que acepta
      locale: Locale('es', 'ES'),
    );

    if(picked != null){
      //si contiene algo el picked lo asignamos a la variable fecha
      setState(() {
        _fecha = picked.toString();
        //cambiamos el controller a texto y le asignamos la fecha seleccionada
        _inputFieldDateController.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    //creamos una lista dinamica(sin especificar el tamaño)
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      //agregamos el contenido de la lista como si fuera un menu item
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,//el contenido del value debe ser del tipo que se pide
      ));
     });

     return lista;

  }

  Widget _crearDropdown(){
    
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(//lo metemos al expanded para que tome todo el espacio disponible
          child: DropdownButton(
            //asignamos la opciona que ha sido seleccionada para que se muestre
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                //asignamos a la variable global la variable seleccionada
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
    
    
    

  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Email $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  
}