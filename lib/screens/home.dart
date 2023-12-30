import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/widgets/todo_item.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // const Home({super.key});
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();
  void _handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone=!todo.isDone;
    });
  }
  void _handleDeleteTodo(String id){
    setState(() {
     todoList.removeWhere((element) => element.id==id);
    });
  }
  void _addTodoItem(String todo) {
    setState(() {
        todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo));
    });
    _todoController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
              width: 40,
            child: ClipRect(
              child: Image.asset('assets/images/user.png'),
            ),
          )
        ]),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: tdBlack,
                        size: 20,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: tdGrey),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom:20),
                        child: Text('All Todoss',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      ),
                      for(ToDo todoo in todoList)
                      TodoItem(
                          todo: todoo,
                        onTodoChanged: _handleTodoChange,
                        onDeleteItem: _handleDeleteTodo,
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
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                  boxShadow: const[BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0,0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  )],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                    hintText: 'Add a new Todo item',
                    border: InputBorder.none,
                  ),
                ),
              )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,right: 20),
                // padding: EdgeInsets.only(bottom: 10,top: 10),
                child: ElevatedButton(
                  child: Text('+',style: TextStyle(fontSize: 40)),
                  onPressed: () {
                    _addTodoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60, 58),
                    // elevation: 10
                  // ),
                ),
              )
              )
            ],)
          )
        ],
      ),
    );
  }
}


