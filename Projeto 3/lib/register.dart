class LoginData {
  int _id;
  String _name;
  String _username;
  String _email;
  String _password;
  int _role;
  String _classroom;

  LoginData(this._name, this._username, this._email, this._password, this._role,
      this._classroom);

  LoginData.fromMap(map) {
    this._id = map["id"];
    this._name = map["name"];
    this._username = map["username"];
    this._email = map["email"];
    this._password = map["password"];
    this._role = map["role"];
    this._classroom = map["class"];
  }

  int get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get password => _password;
  int get role => _role;
  String get classroom => _classroom;

  set name(String newName) {
    if (newName.length > 0) {
      this._name = newName;
    }
  }

  set username(String newUsername) {
    if (newUsername.length > 0) {
      this._username = newUsername;
    }
  }

  set email(String newEmail) {
    if (newEmail.length > 0) {
      this._email = newEmail;
    }
  }

  set password(String newPassword) {
    if (newPassword.length > 0) {
      this._password = newPassword;
    }
  }

  set role(int newRole) {
    if (newRole > 0 && newRole <= 2) {
      this._role = newRole;
    }
  }

  set classroom(String newClassroom) {
    if (newClassroom.length > 0) {
      this._classroom = newClassroom;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map["id"] = _id;
    }

    map["name"] = _name;
    map["username"] = _username;
    map["email"] = _email;
    map["password"] = _password;
    map["role"] = _role;
    map["class"] = _classroom;

    return map;
  }
}
