import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/components/dilouge_style.dart';
import 'package:to_do_app/components/list_style.dart';
import 'package:to_do_app/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box("mybox");
  final _controller = TextEditingController();
  Database db = Database();
  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.creatforfirst();
    } else {
      db.load();
    }
    // TODO: implement initState
    super.initState();
  }

  void checkbox(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.update();
  }

  void addtodo() {
    showDialog(
        context: context,
        builder: (context) {
          return Dilouge(
              Controller: _controller,
              onSave: onSave,
              onCancle: () => Navigator.of(context).pop());
        });
  }

  void onSave() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.clear();
    });
    db.update();
  }

  void delete(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[300],
            elevation: 0,
            title: Center(
              child: Text(
                "T O - D O",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: addtodo,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: ListView.builder(
              itemCount: db.ToDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListStyle(
                  text: db.ToDoList[index][0],
                  value: db.ToDoList[index][1],
                  onChanged: (value) => checkbox(value, index),
                  deletetodo: (context) => delete(index),
                );
              })),
    );
  }
}
