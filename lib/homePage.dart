import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'services/authServices.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

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
            top: 30, 
            left: 30, 
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await authService.signOut();
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ),

       
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
           
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          

                    Column(
                      children: [
 
                        Text(
                          'Tamarutaca',
                          style: TextStyle(
                            fontSize: 32,
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
                            fontSize: 19,
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
                      ],
                    )
                  ],
                ),
  
                SizedBox(height: 20),
      
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/game');
                  },
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Jogar',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PC Senior',
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF34CB79),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Botão de desenvolvedores
                ElevatedButton(
                  onPressed: () {
                     Navigator.pushReplacementNamed(context, '/dev');
                  },
                  child: Text('Desenvolvedores',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PC Senior',
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 52, 125, 203),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
               
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(
                        10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Botão de opções
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/game');
                          },
                          icon: Icon(Icons.settings,
                              color: Colors.white, size: 30),
                          color: Color(0xFF3567BD),
                        ),
                      
                        StreamBuilder<User?>(
                          stream: authService
                              .onAuthStateChanged, 
                          builder: (BuildContext context,
                              AsyncSnapshot<User?> snapshot) {
                            if (snapshot.hasData) {
                            
                              return FutureBuilder(
                                future: authService.getProfileData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // ou outro widget de carregamento
                                  } else {
                                    if (snapshot.hasError) {
                                      return Text('Erro: ${snapshot.error}');
                                    } else {
                                      return snapshot
                                          .data!; 
                                    }
                                  }
                                },
                              );
                            } else {
                          
                              return GestureDetector(
                                onTap: () {
                        
                                  Navigator.pushReplacementNamed(
                                      context, '/auth');
                                },
                                child: Icon(Icons.person,
                                    color: Colors.white, size: 30),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
