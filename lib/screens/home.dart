import 'package:flutter/material.dart';
import 'package:to_do/components/todo_tile.dart';
import 'package:to_do/components/search_bar.dart';
import 'package:to_do/models/todo.dart';
const Color kBackgroundColor =  Colors.grey;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> _todosList = ToDo.todoList();
  final _todoAdding = TextEditingController();
   List<ToDo>  _foundTodo=[];
  void _deleteToDoItem(String id) {
    setState(() {
      _todosList.removeWhere((item) => item.id == id);
    });
  }
  void _addTodoItem(String newtodo){
    setState(() {
      _todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(),todoText:newtodo));
    });
    _todoAdding.clear();
  }

  void _runFilter(String enterkeyward){
    List<ToDo> results = [];
    if(enterkeyward.isEmpty){
      results = _todosList;
    }
    else{
      results = _todosList.where((item) => item.todoText!.toLowerCase().contains(enterkeyward.toLowerCase())).toList();

    }
    setState(() {
      _foundTodo = results;
    });
  }
  @override
  void initState() {
    _foundTodo = _todosList;
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Stack(
          children: [
              Search_Bar(
                onPress: (value) {
                  _runFilter(value);
                },
              ),

            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50.0),
                  margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: const Text('All ToDos', style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),),
                ),
                for (ToDo todo in _foundTodo)
                  ToDO_Tiles(todoslist: todo, onTodoChanged:(){
                    setState(() {
                      todo.isDone = !todo.isDone;
                    });
                  },onTodoDelete: _deleteToDoItem),

              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow:const [BoxShadow(
                          color: Color.fromARGB(40, 40, 36, 42),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.0),
                        )]
                      ),
                      child: TextField(
                          controller:_todoAdding,
                        decoration:const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15.0),
                          hintText: 'Add a new item',
                          hintStyle: TextStyle(
                            color:Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0),
                    decoration: const BoxDecoration(
                    //  borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        _addTodoItem(_todoAdding.text);
                      },
                      style: ElevatedButton.styleFrom(
                      ),
                      child: const Text('+', style: TextStyle(fontSize: 30.0,color: Colors.white ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: Colors.black,size: 30.0,),
          SizedBox(
            width: 35.0,height: 35.0,
           // image: Image(),
            child: ClipRRect(
             // borderRadius: BorderRadius.circular(20.0),
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset('images/pic.jpg'),
            ),
          )
        ],
      ),
    );
  }
}




