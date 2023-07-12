import 'package:firebase_auth/firebase_auth.dart';
import 'package:flameteste/services/googleSignInButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:ui';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool termsAccepted = false;
  bool privacyPolicyAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background-loading.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tamarutaca',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PC Senior',
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Game',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'PC Senior',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 0.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                GoogleSignInButton(),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: privacyPolicyAccepted,
                      onChanged: (value) {
                        setState(() {
                          privacyPolicyAccepted = value!;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Li e aceito a ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'PC Senior',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Política de Privacidade',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 228, 176, 42),
                              fontFamily: 'PC Senior',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _showPrivacyPolicy(context);
                              },
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'PC Senior',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    String termsAndConditions = """
Termos de serviço:
1. Ao utilizar este aplicativo, você concorda em não violar nenhuma lei, regulamento, contrato de terceiros ou nossas políticas.
2. Você é responsável pelo conteúdo que postar neste aplicativo e assume todos os riscos associados a ele.
3. Este aplicativo não é responsável pelo conteúdo postado pelos usuários.

Política de Privacidade:
1. Coletamos informações pessoais para fornecer e melhorar nosso serviço.
2. Compartilharemos informações pessoais apenas com terceiros quando formos legalmente obrigados a fazê-lo.
3. Você tem o direito de acessar, atualizar e excluir suas informações pessoais.
""";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Política de Privacidade'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(termsAndConditions),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
