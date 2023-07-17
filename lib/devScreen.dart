import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:ui';

class DeveloperPage extends StatefulWidget {
  DeveloperPage({Key? key}) : super(key: key);

  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {

  void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Não foi possível abrir $url';
  }
}

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
                  'Desenvolvedores',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PC Senior',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/autores/gustavo.png'),
                        ),
                        Text('Gustavo',
                            style: TextStyle(fontFamily: 'PC Senior', fontSize: 12)),
                            Padding(padding: EdgeInsets.only(top: 10)),
                      ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.grey, 
    ),
  ),
  onPressed: () {
 
  },
  child: Row(
    children: [
      Image.asset('assets/images/github.png', height: 23),
      SizedBox(width: 8), // Ajuste o espaçamento entre a imagem e o texto conforme necessário
      Text(
        '',
        style: TextStyle(
          fontFamily: 'PC Senior',
          fontSize: 12,
          color: Colors.white, // Defina a cor do texto conforme desejado
        ),
      ),
    ],
  ),
),

Padding(padding: EdgeInsets.only(top: 10)), // Ajuste o espaçamento entre os botões con
ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.blue, 
    ),
  ),
  onPressed: () {
  
  },
  child: Row(
    children: [
      Image.asset('assets/images/linkedin.png', height: 23),
      SizedBox(width: 8), // Ajuste o espaçamento entre a imagem e o texto conforme necessário
      Text(
        '',
        style: TextStyle(
          fontFamily: 'PC Senior',
          fontSize: 12,
          color: Colors.white, 
        ),
      ),
    ],
  ),
),

                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/autores/natan.png'),
                        ),
                        Text('Natan',
                            style: TextStyle(fontFamily: 'PC Senior', fontSize: 12)),
                        Padding(padding: EdgeInsets.only(top: 10)),
                      ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.grey, 
    ),
  ),
  onPressed: () {
  },
  child: Row(
    children: [
      Image.asset('assets/images/github.png', height: 23),
      SizedBox(width: 8), 
      Text(
        '',
        style: TextStyle(
          fontFamily: 'PC Senior',
          fontSize: 12,
          color: Colors.white, 
        ),
      ),
    ],
  ),
),

Padding(padding: EdgeInsets.only(top: 10)), // Ajuste o espaçamento entre os botões con
ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.blue, 
    ),
  ),
  onPressed: () {
    _launchURL('https://www.linkedin.com/in/natan-vaz/');
  },
  child: Row(
    children: [
      Image.asset('assets/images/linkedin.png', height: 23),
      SizedBox(width: 8), // Ajuste o espaçamento entre a imagem e o texto conforme necessário
      Text(
        '',
        style: TextStyle(
          fontFamily: 'PC Senior',
          fontSize: 12,
          color: Colors.white, 
        ),
      ),
    ],
  ),
),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/autores/gabriel.png'),
                        ),
                        Text('Gabriel',
                            style: TextStyle(fontFamily: 'PC Senior', fontSize: 12)),
                        Padding(padding: EdgeInsets.only(top: 10)),
                      ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.grey, 
    ),
  ),
  onPressed: () {
    
  },
  child: Row(
    children: [
      Image.asset('assets/images/github.png', height: 23),
      SizedBox(width: 8), 
      Text(
        '',
        style: TextStyle(
          fontFamily: 'PC Senior',
          fontSize: 12,
          color: Colors.white, 
        ),
      ),
    ],
  ),
),

Padding(padding: EdgeInsets.only(top: 10)), // Ajuste o espaçamento entre os botões con
ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.blue, 
    ),
  ),
  onPressed: () {
   
  },
  child: Row(
    children: [
      Image.asset('assets/images/linkedin.png', height: 23),
      SizedBox(width: 8), 
      Text(
        '',
        style: TextStyle(
          fontFamily: 'PC Senior',
          fontSize: 12,
          color: Colors.white, 
        ),
      ),
    ],
  ),
),
                      ],
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
}
