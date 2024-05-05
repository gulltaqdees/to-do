import 'package:flutter/material.dart';
import 'package:to_do/models/todo.dart';
class ToDO_Tiles extends StatelessWidget {
  final VoidCallback onTodoChanged;
  final onTodoDelete;
  final ToDo todoslist;
  const ToDO_Tiles({super.key,required this.todoslist ,required this.onTodoChanged, required this.onTodoDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      child: ListTile(
        onTap: onTodoChanged,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        leading: Icon(todoslist.isDone?Icons.check_box:Icons.check_box_outline_blank,color:  Colors.blue ,),
        title: Text(todoslist.todoText!, style: TextStyle(color: Colors.black, decoration: todoslist.isDone?TextDecoration.lineThrough:TextDecoration.none),),
        trailing: Container(
          width:40,height: 40.0,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: IconButton(onPressed:()=>onTodoDelete(todoslist.id),icon: const Icon(Icons.delete, color: Colors.white, )),

        ),

        //focusColor: Colors.black,
      ),
    );
  }
}