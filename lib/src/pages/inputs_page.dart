import 'package:flutter/material.dart';
import 'package:widgets/src/utils/date_utils.dart';

class InputFieldsPage extends StatefulWidget {
  @override
  _InputFieldsPageState createState() => _InputFieldsPageState();
}

class _InputFieldsPageState extends State<InputFieldsPage> {
  String _name;
  String _email;
  String _password;
  String _selectedItem;

  TextEditingController _inputDateController;
  List<String> _listPowers = [
    'Volar',
    'Super Fuerza',
    'Super Aliento',
    'Rayos X'
  ];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _inputDateController.dispose();
    super.dispose();
  }

  void _initData() {
    _name = '';
    _email = '';
    _password = '';
    _selectedItem = _listPowers.first;
    _inputDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Fields'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: <Widget>[
          _createInput(),
          SizedBox(height: 10.0),
          _createEmailInput(),
          SizedBox(height: 10.0),
          _createPasswordInput(),
          SizedBox(height: 10.0),
          _createDate(context),
          SizedBox(height: 10.0),
          _createDropDown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Name',
        counter: Text('Letras ${_name.length}'),
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (input) {
        setState(() {
          _name = input;
        });
      },
    );
  }

  Widget _createEmailInput() {
    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (input) {
        setState(() {
          _email = input;
        });
      },
    );
  }

  Widget _createPasswordInput() {
    return TextField(
      obscureText: true,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_outline),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (input) {
        setState(() {
          _password = input;
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputDateController,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: Icon(Icons.date_range),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      readOnly: true,
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime dateTime = await showDatePicker(
      context: context,
      firstDate: new DateTime(1999),
      initialDate: DateTime.now(),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'MX'),
    );

    if (dateTime != null) {
      _inputDateController.text = formatDate(dateTime);
    }
  }

  Widget _createDropDown() {
    var drop = DropdownButton(
      items: getOptions(),
      value: _selectedItem,
      onChanged: (selected) {
        setState(() {
          _selectedItem = selected;
        });
      },
    );

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 15.0),
        Expanded(child: drop),
      ],
    );
  }

  List<DropdownMenuItem> getOptions() {
    List<DropdownMenuItem> items = List();
    _listPowers.forEach((power) {
      items.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return items;
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedItem),
    );
  }
}
