import 'package:flutter/material.dart';

import 'home1.dart';
import 'todo.dart';
import 'colors.dart';
import 'todo_item.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
          title: Text('Trang chủ'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                icon: Icon(Icons.keyboard_return_sharp))
                
                
          ]
      // title: const Text('Trang Chủ'),
  
       
  ),
  
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(child: Column(
          children:  [
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            SizedBox(height: 8),
            Text('Nhóm 1',
            style: TextStyle(fontSize: 28, color: Colors.blue
            ),
            ),
          ],
        ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Hội thoại'),
          textColor: Colors.blue,
          iconColor: Color.fromARGB(255, 246, 21, 4),
        ),
         ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Sức khỏe'),
          textColor: Colors.blue,
          iconColor: Color.fromARGB(255, 246, 4, 214),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Thông tin'),
          textColor: Colors.blue,
          iconColor: Color.fromARGB(255, 235, 126, 2),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Vị trí'),
          textColor: Colors.blue,
          iconColor: Color.fromARGB(255, 5, 237, 5),
        ),
        
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Cài đặt'),
          textColor: Colors.blue,
          iconColor: Color.fromARGB(255, 244, 228, 5),
        ),
        
      ],
    ),
  ),
      body: Stack(
        children: [
          
            
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Danh sách công việc',
                          style: TextStyle(
                            fontSize: 30,
                            color: tdRed,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Thêm công việc lưu ý',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
//Hàm gạch
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id); 
    });
  }
// Thêm công việc
  void _addToDoItem(String toDo) { 
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }
// Hàm tìm kiếm
  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }
// Tìm kiếm
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Tìm kiếm',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  
}
