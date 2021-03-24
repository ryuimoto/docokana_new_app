class User {
  final int id;
  final String email;
  final String fname;
  final String lname;
  final String phone;
  final String password;
  List imageUrl = [];

  User({
    this.id,
    this.email,
    this.fname,
    this.lname,
    this.phone,
    this.password,
    this.imageUrl,
  });
}
