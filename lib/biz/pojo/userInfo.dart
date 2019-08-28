class UserInfo {
  var _name;
  var _loginId;
  var _company;
  var _sex;
  var _phone;

  UserInfo(this._name, this._loginId, this._company, this._sex, this._phone);

  @override
  String toString() {
    return 'UserInfo{_name: $_name, _loginId: $_loginId, _company: $_company, _sex: $_sex, _phone: $_phone}}';
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get sex => _sex;

  set sex(value) {
    _sex = value;
  }

  get company => _company;

  set company(value) {
    _company = value;
  }

  get loginId => _loginId;

  set loginId(value) {
    _loginId = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
}
