import 'package:flutter/material.dart';
import 'package:studentt/main.dart';
class page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: new Text("student"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: new Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/person.png',
                width: 120,
                height: 150,
              ),
              Text(
                'roaa hussin',
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "student id",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.add),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "age",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.details),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "semister",
              ),
            ),
          ),



        ],
      ),
    );
  }
}