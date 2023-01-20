
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    const MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  late List usuariosData;
  

  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:3000/api/usuarios'));
    data = json.decode(response.body);
    setState(() {
      usuariosData = data['rows'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 28, 64),
        title: const Text('Usuarios Inxeniux', style: TextStyle(color: Color.fromARGB(255, 242, 107, 29),)),
      ),
      body: ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: usuariosData == null ? 0 : usuariosData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                  Row (
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${usuariosData[index]["id"]}", style: const TextStyle(
                          fontSize: 16.0, 
                          fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                      const CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Color.fromARGB(0, 105, 115, 228),
                        backgroundImage: NetworkImage('https://th.bing.com/th/id/R.1c0973cfbfd25178d72b0b0a93206625?rik=z8y8Ftm1919VOw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_299586.png&ehk=LBhfOw4KDHaDyrvk21Bac0nzxkAym5hWC8dHAAZ58oo%3d&risl=&pid=ImgRaw&r=0'),
                      ),
                      Padding(padding: const EdgeInsets.all(16.0),
                        child: Text("${usuariosData[index]["nombre"]}" ,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                      ),
                    ],
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Padding(padding: const EdgeInsets.all(20.0),
                      // ignore: prefer_const_constructors
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text("Nombre Completo: ${usuariosData[index]["nombre"]} ${usuariosData[index]["apellidos"]}", textAlign: TextAlign.justify,
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Edad: ${usuariosData[index]["edad"]}", textAlign: TextAlign.justify,
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Telefono: ${usuariosData[index]["telefono"]}",
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Pais: ${usuariosData[index]["pais"]}",
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Estado: ${usuariosData[index]["estado"]}",
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Municipio: ${usuariosData[index]["municipio"]}",
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Localidad: ${usuariosData[index]["localidad"]}", 
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Idioma: ${usuariosData[index]["idioma"]}",
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          // ignore: prefer_const_constructors
                          Text("Pasatiempos: ${usuariosData[index]["pasatiempos"]}",
                            style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                            )
                          )
                        ],
                      )

                      )
                    ],
                  )
                  ],
                )
                
              ),
            );
          }),
    );
  }
}

