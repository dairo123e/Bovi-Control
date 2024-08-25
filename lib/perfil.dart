import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Añade esta línea

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil del Ganadero'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green[200],
                backgroundImage:
                    _image != null ? FileImage(File(_image!.path)) : null,
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 50,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Nombre del Ganadero",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.green[50],
                labelStyle: TextStyle(color: Colors.green[800]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Nombre de la Finca",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.green[50],
                labelStyle: TextStyle(color: Colors.green[800]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Ubicación de la Finca",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.green[50],
                labelStyle: TextStyle(color: Colors.green[800]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Número de Cabezas de Ganado",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.green[50],
                labelStyle: TextStyle(color: Colors.green[800]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Tipo de Ganado",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.green[50],
                labelStyle: TextStyle(color: Colors.green[800]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar la lógica para guardar el perfil
              },
              child: Text('Guardar Perfil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                minimumSize: Size(double.infinity, 50),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
