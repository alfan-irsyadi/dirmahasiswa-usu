import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Album {
  final String title, userId, id;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['nama'],
      id: json['email'],
      title: json['nim'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://direktori.usu.ac.id/mahasiswa/search?nim=190803001'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print(jsonDecode(response.body)[0]);
    return Album.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

List alfan = [];

void al() async {
  List<Map<String, dynamic>> listJson = [
    {"nama": "alfan", "nim": 190803102}
  ];
  Album alb = await fetchAlbum();
  // print(listJson[0]['nama']);
  alfan.add(alb);
}

void main() async {
  al();
  print(alfan);
}
