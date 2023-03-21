class SignUpModel{
  String? uid;
  String? name;
   String? username;
   String? email;
   String? password;
   String? type;
  SignUpModel({
    this.uid,
     this.email,
    this.type,
     this.name,
    this.username,
     this.password}
  );
   factory SignUpModel.fromMap(map) {
    return SignUpModel(
        uid: map['uid'],
        email: map['email'],
        name: map['Name'],
        password: map['password'],
        username: map['username'],
        type: map['Type']
        );
  }
  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'Name': name,
      'Type': type,
      'username': username,
      'email': email,
      'password': password
    };
  }
}