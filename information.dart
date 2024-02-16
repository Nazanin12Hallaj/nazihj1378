import 'dart:io';
import 'person.dart';
import 'todo.dart';
class Information{
  List <Person>persons=[];
  List <Todo> todos=[];

  void menu(){
  print('1)Registration of persons profile');
  print('2)Registration to do and title todo of the person ');
  print('3)show person todos and title todos ');
  print('4)show todos');
  print('5)done todos');
  print('6)change the todos');
  print('7)remove the todos');
  print('8)exit');
}
  void personProfiles(){
    print('please input the person first name:');
    String firstName=inputString();

    print('please input the person last name:');
    String lastName=inputString();

   persons.add(Person(firstName: firstName, lastName: lastName));

    print('*******the first name and last name of the person was registered*********');


  }
  void personTotal() {
    if (persons.isEmpty) {
      print('persons list is empty');
      print('please input the number of options again');
      option();
    } else {
      showListPerson();
      print('please selection user');
      int number = input();
      while (number < 1 || number > persons.length) {
        print('please selection  user');
        number = input();
      }

      print('input todo:');
      String todo =inputString();

      print('please input titleTodo');
      String titleTodo = inputString();

      print('******title todo this user is logged****');
      todos.add(Todo(person: persons[number - 1], todo: todo, titleTodo: titleTodo));
      print('todo information entered');
    }
  }
  void showListPerson(){
    for(int i=0;i<persons.length;i++){
      print('${i+1}. first name:${persons[i].firstName}  last name:${persons[i].lastName}');
    }
  }
  void showListTodo(){
    if(todos.isEmpty){
      print('todo list is empty');
      print('please input the number of options again ');
      option();
    }
    for(int i=0;i<todos.length;i++){
      print('${i+1}. todo:${todos[i].todo} titleTodo:${todos[i].titleTodo } done:${todos[i].isDone}');
    }
  }

  void showListPersonAndTodo(){
    if(persons.isEmpty||todos.isEmpty){
      print('todo list is empty');
      print('please input the number of options again ');
      option();
    }else{
      for(int i=0;i<persons.length;i++){
        print('${i+1})person:${persons[i].firstName } ${persons[i].lastName} ');
        for(int x=0;x<todos.length;x++ ) {
          if(todos[x].person==persons[i]) {
            print('     todo:${todos[x].todo} titleTodo:${todos[x].titleTodo } done:${todos[x].isDone}');

          }
        }
      }
    }
  }
  void done(){
    if(todos.isEmpty){
      print('todo list is empty');
      print('please input the number of options again ');
      option();
    }else {
      showListTodo();
      print('enter the desired todo option');
      int todoOption =input();
      while(todoOption<1||todoOption>todos.length){
        print('enter the desired todo option');
        todoOption =input();
      }
      if(todos[todoOption-1].isDone==true){
        print('this todo is done');
      }else {
        todos[todoOption - 1].isDone= true;
      }
    }
  }
  void changeTodo(){
    if(todos.isEmpty){
      print('todo list is empty');
      print('please input the number of options again ');
      option();
    }else{
      showListTodo();
      print('enter the desired todo option');
      int todoOption=input();
      while(todoOption<1||todoOption>todos.length){
        print('enter the desired todo option');
        todoOption=input();
      }
      if(todos[todoOption-1].isDone==true){
        print('todo is done you cant change this todo');
        option();
      }else{
        print('input new todo');
        String?newTodo=inputString();

       todos[todoOption-1].todo=newTodo;
       print('input new title todo');
       String?newTitleTodo=stdin.readLineSync();

       todos[todoOption-1].titleTodo=newTitleTodo!;
      }
    }
  }
  void removeTodo(){
    if(todos.isEmpty){
      print('todo list is empty');
      print('please input the number of options again ');
      option();
    }else{
      showListTodo();
      print('enter the desired todo option');
      int todoOption=input();
      while(todoOption<1||todoOption>todos.length){
      print('enter the desired todo option');
      todoOption=input();
      }
      todos.removeAt(todoOption-1);
    }
  }




  void option(){
    menu();
   while(true){
     print('please input the option');
     String number=inputString();
     switch(number){
       case'1':
         personProfiles();
         option();
         break;
       case'2':
         personTotal();
         option();
       case'3':
         showListPersonAndTodo();
         option();
         break;
       case'4':
         showListTodo();
         option();
         break;
       case'5':
         done();
         option();
         break;
       case'6':
         changeTodo();
         option();
         break;
       case'7':
        removeTodo();
         option();
       case'8':
         exit(0);
       default:
         option();
         break;
     }
   }
  }
}

String inputString() {
  var inp = stdin.readLineSync();
  if (inp!.trim()=='') {
    print('Please Enter Something');
    return inputString();
  } else {
    return inp;
  }
}


int input() {
  var inp = stdin.readLineSync();
  while (isNumeric(inp) == false) {
    print('Please Enter Just a Number');
    inp = stdin.readLineSync();
  }
  return int.parse(inp!.trim());
}

bool isNumeric(String? input) {
  if (input == null) {
    return false;
  }
  return int.tryParse(input) != null;
}
