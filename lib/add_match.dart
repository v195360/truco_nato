import 'package:flutter/material.dart';
import 'package:truco_nato/match_history.dart';
import 'package:truco_nato/model/match_detail.dart';
import 'package:truco_nato/profile.dart';
import 'package:truco_nato/provider/firebase_firestore.dart';

class AddMatch extends StatefulWidget {
  @override
  _AddMatchState createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  String oponente = '';
  String resultado = '';
  int pontosOponente = 0;
  int pontosJogador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFBfa2632),
        title: Text('Nova Partida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  oponente = value;
                });
              },
              decoration:
                  InputDecoration(labelText: 'Insira o nome do oponente'),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pontosJogador++;
                        checkCounter(pontosJogador, 'jogador');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: CircleBorder(),
                      padding:
                          EdgeInsets.all(40.0), // Adjust the size as needed
                    ),
                    child: Text(
                      '$pontosJogador',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Você',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                SizedBox(width: 60), // Adjust the spacing between buttons
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          pontosOponente++;
                          checkCounter(pontosOponente, 'oponente');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: CircleBorder(),
                        padding:
                            EdgeInsets.all(40.0), // Adjust the size as needed
                      ),
                      child: Text(
                        '$pontosOponente',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '$oponente',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MatchHistory()),
          );
        },
        child: Icon(Icons.close_rounded),
        backgroundColor: Colors.black,
      ),
    );
  }

  void checkCounter(int counter, String jogador) {
    if (counter == 12) {
      showPopup(jogador);
    }
  }

  void showPopup(String jogador) {
    String message = jogador == 'oponente'
        ? 'Seu oponente venceu a partida.'
        : 'Você ganhou a partida';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Partida finalizada'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () async {
                // Create an instance of your MatchDetail class with the relevant data
                MatchDetail match = MatchDetail.withData(
                  pontosJogador: pontosJogador,
                  pontosOponente: pontosOponente,
                  resultado: jogador,
                  oponente: oponente,
                  data: DateTime.now().toString(),
                );

                // Get the instance of FirestoreDatabase
                FirestoreDatabase database = FirestoreDatabase.helper;

                // Insert the match into Firestore
                await database.insertMatch(match);

                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Partida salva com sucesso.')),
                );
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
