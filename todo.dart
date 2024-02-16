import 'person.dart';

class Todo{
   String todo;
   String titleTodo;
   Person person;
   bool isDone=false;
  Todo({required this.person,required this.todo,required this.titleTodo});
}