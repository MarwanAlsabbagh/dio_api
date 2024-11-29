class EmployeeModel{
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;
  EmployeeModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}
