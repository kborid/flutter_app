class UserInfo {
  var _name;
  var _loginId;
  var _company;
  var _sex;
  var _phone;

  UserInfo(this._name, this._loginId, this._company, this._sex, this._phone);

  String get name => _name;

  String get loginId => _loginId;

  String get company => _company;

  String get sex => _sex;

  String get phone => _phone;

  @override
  String toString() {
    return 'UserInfo{_name: $_name, _loginId: $_loginId, _company: $_company, _sex: $_sex, _phone: $_phone}}';
  }
}
