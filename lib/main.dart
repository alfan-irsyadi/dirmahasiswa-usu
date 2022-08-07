import 'package:flutter/material.dart';

import 'kueri.dart';

GlobalKey key1 = GlobalKey();

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColorDark: Color(0xff133A1B), primaryColor: Color(0xff26580f)),
    home: mainScreen(),
  ));
}

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size1 = MediaQuery.of(context).size;
    double w = size1.width - 40, h = size1.height;
    TextEditingController _textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff133A1B),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/dirmausu2.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: w * 4 / 5 - 20,
                  height: 80,
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff133A1B), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'NIM/NAMA',
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                  )),
              Container(
                width: w * 2 / 5 - 60,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff133A1B)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyApp(_textEditingController.text)));
                    },
                    child: Text('Search')),
              )
            ],
          )
        ]),
      ),
    );
  }
}
