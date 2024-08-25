import 'package:flutter/material.dart';

class EventosTareasPage extends StatefulWidget {
  @override
  _EventosTareasPageState createState() => _EventosTareasPageState();
}

class _EventosTareasPageState extends State<EventosTareasPage> {
  final _formKey = GlobalKey<FormState>();
  String? _tipo;
  String? _descripcion;
  DateTime? _fecha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos y Tareas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _tipo,
                items: [
                  DropdownMenuItem(
                      value: 'Feria Ganadera', child: Text('Feria Ganadera')),
                  DropdownMenuItem(
                      value: 'Vacunación', child: Text('Vacunación')),
                  DropdownMenuItem(value: 'Purgar', child: Text('Purgar')),
                  DropdownMenuItem(value: 'Fumigar', child: Text('Fumigar')),
                  DropdownMenuItem(
                      value: 'Alimentar', child: Text('Alimentar')),
                ],
                onChanged: (value) {
                  setState(() {
                    _tipo = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tipo de Evento o Tarea',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null ? 'Por favor selecciona un tipo' : null,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _descripcion = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _fecha) {
                    setState(() {
                      _fecha = picked;
                    });
                  }
                },
                child: Text('Seleccionar Fecha'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    _formKey.currentState?.save();
                    // Mostrar los datos en un SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Evento/Tarea guardado: $_tipo - $_descripcion en la fecha: $_fecha'),
                      ),
                    );
                  }
                },
                child: Text('Guardar Evento/Tarea'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
