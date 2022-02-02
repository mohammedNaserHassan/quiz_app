class Person{
  int id;
  String name;
  String email;
  String password;
  Person({this.id,this.email,this.password,this.name});

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'email':email,
      'password':password,
      'name':name,
    };
  }
  factory Person.fromMap(Map<String,dynamic> products){
    return Person(
        id: products['id'],
        email: products['email'],
        password: products['password'],
        name: products['name'],
    );
  }
}