import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Paypal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'CAZA'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey, // Establece el color de fondo gris
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/LogoCaza.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenido a la Fundación Benéfica',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent
              ),
            ),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Nuestra misión es ayudar a aquellos que más lo necesitan. Trabajamos en proyectos y programas que impactan positivamente a comunidades y personas vulnerables.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonationPage()),
                );
              },
              child: Text('Comprar Boleto'),
            ),
          ],
        ),
      ),
    );
  }
}
class DonationPage extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gracias por tu donación'),
          content: Text('¡Tu generosidad es muy apreciada!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage(title: 'Proceso de pago')),
                );
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donación'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),  // Márgenes horizontales de 16 y verticales de 8
              child: Text(
                'Caza',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            Text(
              'Ingrese la cantidad de boletos a comprar:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cantidad',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de donar
                String amount = _amountController.text;
                // Realizar el procesamiento o envío de la cantidad donada
                // Puedes agregar aquí la lógica para enviar la cantidad donada a través de una API, base de datos, etc.

                // Mostrar el mensaje de agradecimiento y regresar a la ventana principal
                _showThankYouDialog(context);


              },
              child: Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}

