class client{
  String id;
  String full_name;
  String email;
  String phone_number ;

  client.fromMap(Map<String, dynamic> data, this.id){
    this.full_name = data["full name"];
    this.email = data["email"];
    this.phone_number = data["phone number"];
  }
}