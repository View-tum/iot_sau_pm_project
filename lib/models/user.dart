class User {
  String? message;
  String? userId;
  String? userFullname;
  String? userEmail;
  String? userName;
  String? userPassword;

  User(
      {this.message,
      this.userId,
      this.userFullname,
      this.userEmail,
      this.userName,
      this.userPassword});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userFullname = json['userFullname'];
    userEmail = json['userEmail'];
    userName = json['userName'];
    userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['userFullname'] = this.userFullname;
    data['userEmail'] = this.userEmail;
    data['userName'] = this.userName;
    data['userPassword'] = this.userPassword;
    return data;
  }
}
