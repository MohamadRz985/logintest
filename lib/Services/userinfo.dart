class UserInfo {
  String? _userPrincipalName;
  String? _displayName;
  String? _sAMAccountName;
  String? _lastlogon;

  UserInfo({
    String? userPrincipalName,
    String? displayName,
    String? sAMAccountName,
    // String? lastLogon,
  }) {
    _userPrincipalName = userPrincipalName;
    _displayName = displayName;
    _sAMAccountName = sAMAccountName;
    // _lastlogon = lastLogon;
  }

  String get userPrincipalName => _userPrincipalName!;
  set userPrincipalName(String userPrincipalName) =>
      _userPrincipalName = userPrincipalName;
  String get displayName => _displayName!;
  set displayName(String displayName) => _displayName = displayName;
  String get sAMAccountName => _sAMAccountName!;
  set sAMAccountName(String sAMAccountName) => _sAMAccountName = sAMAccountName;

  String get lastLogon => _lastlogon!;
  // set lastLogon(String LastLogon) => _lastlogon = LastLogon;

  UserInfo.fromJson(Map<String, dynamic> json) {
    _userPrincipalName = json['userPrincipalName'];
    _displayName = json['displayName'];
    _sAMAccountName = json['sAMAccountName'];
    // _lastlogon = json['LastLogon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userPrincipalName'] = _userPrincipalName;
    data['displayName'] = _displayName;
    data['sAMAccountName'] = _sAMAccountName;
    // data['LastLogon'] = _lastlogon;
    return data;
  }
}
