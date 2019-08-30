class QuickAppInfo {
  var _name;
  var _iconUrl;
  var _targetUrl;

  QuickAppInfo(this._name,
      [this._targetUrl = "http://www.baidu.com",
      this._iconUrl =
          "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg"]);

  @override
  String toString() {
    return 'QuickAppInfo{_name: $_name, _iconUrl: $_iconUrl, _targetUrl: $_targetUrl}';
  }

  get targetUrl => _targetUrl;

  set targetUrl(value) {
    _targetUrl = value;
  }

  get iconUrl => _iconUrl;

  set iconUrl(value) {
    _iconUrl = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
}
