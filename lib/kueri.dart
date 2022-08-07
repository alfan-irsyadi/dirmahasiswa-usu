import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatelessWidget {
  MyApp(this.nim);
  final String nim;

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(
        Uri.parse("https://direktori.usu.ac.id/mahasiswa/search?nim=" + nim));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dirmahasiswa USU created by Alfan Irsyadi'),
        backgroundColor: Color(0xff133A1B),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(snapshot.data[index]['foto']),
                      ),
                      title: Text(snapshot.data[index]['nim'] +
                          " " +
                          snapshot.data[index]['nama']),
                      subtitle: Text(snapshot.data[index]['email']),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
