
//named parameter
/*String describe({String name='', int age=0, double height=0.0})
{
  return "Hello my name is $name.I'm $age years old.I'm $height metres tall";
}*/
//default variable with default value(height)
/*String describe(String name, int age, [height=0.0])
{
  return "Hello my name is $name.I'm $age years old.I'm $height metres tall";
}*/
//arrow => operator for short functions and easy way
/*String describe2({String name='', int age=0, double height=0.0})=>
"Hello my name is $name.I'm $age years old.I'm $height metres tall";

void sayname(String name)=> print("hello I'm $name");*/

class Person
{
  final String name;
  final int age;
  final double height;
  Person({this.name='',this.age=0,this.height=0.0});
  void Print()=>print("Hello my name is $name.I'm $age years old.I'm $height metres tall");
  @override
  String toString()=>'name:$name,age:$age,height:$height';

}
class Employee extends Person
{
  final String taxcode;
  final int salary;
  Employee({String name='',int age=0,double height=0.0,this.taxcode='',this.salary=0})
      :super(name:name,age:age,height:height);
  @override
  String toString()=>'${super.toString()},taxcode:$taxcode,salary:$salary';
}
int Sum(List<int> values)
{
  return values.fold(0,(result,value)=>result+value);
  /*var result=0;
  for(int value in values)
  {
    result+=value;
  }
  return result;*/
}
enum networkError
{
  badUrl,
  timeout,
  resource,
}
void printError(networkError error)
{
  switch(error)
  {
    case networkError.badUrl:
      print('bad Url');
      break;
    case networkError.timeout:
      print('timeout');
      break;
    case networkError.resource:
      print('resource');
      break;
  }
}
void main()
{
  //var=auto
  /*var name = 'Shantanu Roy';
  var age = 20;
  //dynamic=type can be changed
  dynamic height = 1.80;*

  print("Hello I'm $name");
  print("$name has ${name.length} letters");
  print("My age is $age");
  print("My height is $height");*/


  //named parameters
  /*String person1 = describe(name: name,age: age,height: height);
  final person2 = describe2(name: 'Matt', age: 19, height: 1.67);
  print(person1);
  print(person2);
  sayname(name);*/

  //height="Shantanu";
  //print("My height is $height");

  final person=Person(name:'Shantanu Roy',age:20,height:1.76);
  final employee=Employee(name:'Shantanu Roy',age:20,height:1.76,taxcode:'ABCD',salary:12000);
  print(person.name);
  person.Print();
  employee.Print();
  print(employee.toString());
  //person.name="Roy";
  //print(person.name);
  final values=[1,2,3,4,5];
  print(Sum(values));
  printError(networkError.timeout);
}