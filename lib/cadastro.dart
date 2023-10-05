import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20), // Espaçamento maior aqui
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaçamento maior aqui
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaçamento maior aqui
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Idade',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaçamento maior aqui
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaçamento maior aqui
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            // Coloque aqui a lógica para processar o cadastro
                          },
                          child: Text('Cadastrar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}