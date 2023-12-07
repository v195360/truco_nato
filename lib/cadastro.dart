import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> cadastrarUsuario(
      String nome, String email, String idade, String senha) async {
    try {
      // Verifique se todos os campos estão preenchidos
      if (nome.isEmpty || email.isEmpty || idade.isEmpty || senha.isEmpty) {
        // Exiba uma mensagem de erro ao usuário, por exemplo, usando um Snackbar.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor, preencha todos os campos.')),
        );
        return;
      }

      // Use o Firebase Authentication para criar um novo usuário
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);

      // Obtenha o UID do usuário recém-cadastrado
      final String uid = userCredential.user!.uid;

      // Agora, você pode adicionar os outros detalhes do usuário ao banco de dados Firestore, se necessário.

      // Exiba uma mensagem de sucesso ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );

      // Você pode redirecionar o usuário para a próxima tela ou executar outras ações necessárias.
    } catch (e) {
      // Em caso de erro, trate-o adequadamente e exiba uma mensagem de erro ao usuário.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar usuário: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
                          controller: _nameController,
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
                          controller: _emailController,
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
                          controller: _ageController,
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
                          controller: _passwordController,
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
                              cadastrarUsuario(
                                  _nameController.text,
                                  _emailController.text,
                                  _ageController.text,
                                  _passwordController.text);
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
      ),
    );
  }
}
