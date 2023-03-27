class UserMenuInfo {
  String email;
  String userName;

  UserMenuInfo(this.email, this.userName);

  void setEmail(String email) => this.email = email;

  void setUserName(String userName) => this.userName = userName;

  String getEmail() {
    return this.email;
  }

  String getUserName() {
    return this.userName;
  }
}
