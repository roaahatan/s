import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:studentt/page2.dart';
import 'package:shared_preferences/shared_preferences.dart';
  flutterDataSet()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', 'flutter');
  }


void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "  STUDENT GROUP ",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name ='STUDENT GROUP';

  loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
    });

  }
  @override
  iniState(){
    super.initState();
    loadData();
  }
  List<String> groups = [];
  final controller = TextEditingController();

  Widget build(context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text("STUDENT GROUP"),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: onPressed,

      child: Text('  new  '),

    ),

    body: groups.isEmpty

        ? Center(child: Text('empty'))
        : ListView(
      children: [
        ...groups.map(
              (group) => Card(
              elevation: 3,
              child: ListTile(
                title: Text(group),
                trailing: Icon(Icons.details),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => page1())),
              )
          ),
        )
      ],
    ),
  );

  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(" add  group"),
        content: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(60)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              suffixIcon: Icon(Icons.group),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Group name ......",


            ),
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text("add"),
            color: Colors.blueGrey,
            onPressed: () {
              setState(() => groups.add(controller.text));
              controller.clear();
              Navigator.of(context).maybePop();
            },
          ),
          RaisedButton(
            child: Text("exit"),
            color: Colors.grey,
            onPressed: () {
              controller.clear();
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
    );
  }
}
class page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(" GROUP 1"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context)=> page2()

          )
          );

        }



      ),
      body: Container(
        child: Center(
          child: Text(
            'No students yet'
            'Please add your students now',
            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

  }




}