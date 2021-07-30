class Person{
  int id;
  String email;
  String password;
  Person({this.id,this.email,this.password});

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'email':email,
      'password':password
    };
  }
  factory Person.fromMap(Map<String,dynamic> products){
    return Person(
        id: products['id'],
        email: products['email'],
        password: products['password']
    );
  }
}