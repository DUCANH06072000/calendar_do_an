class Constant {
  /// Network
  static const int STATUS_NETWORK_DISCONNECTED = 0;
  static const int STATUS_NETWORK_CONNECTED = 1;
  static const int STATUS_NETWORK_UNKNOWN = 2;

  /// Status Code
  static const int STATUS_CODE_UNKNOW = -1;
  static const int STATUS_CODE_NO_INTERNET = -2;
  static const int STATUS_CODE_CANCEL = -3;
  static const int STATUS_CODE_TIMEOUT = -4;
  static const int STATUS_CODE_SEND_TIMEOUT = -5;
  static const int STATUS_CODE_RECEIVE_TIMEOUT = -6;

  /// Screen
  static const String HOME_SCREEN = "HOME_SCREEN";
  static const String LOGIN_SCREEN = "LOGIN_SCREEN";
  static const String REGISTER_SCREEN = "REGISTER_SCREEN";
  static const String FORGOT_PASSWORD_SCREEN = "FORGOT_PASSWORD_SCREEN";

  /// Mailbox
  static final int TYPE_MESSAGE = 1;
  static final int TYPE_WARING = 2;
  static final int TYPE_PROMOTION = 3;

  /// Sex
  static const int SEX_MAN = 0;
  static const int SEX_WOMEN = 1;
  static const int SEX_OTHER = 2;

  ///storeStatus
  static const int DEACTIVATE = 0; //Tạm ngừng
  static const int WAIT = 3; //Chờ duyệt
  static const int REFUSE = 4; //Từ chối
  static const int ACTIVE = 1; //Kích hoạt
  static const int DELETE = 2; //Xóa
  static const int ALL_STORE = 5; //Tất cả

  ///Account
  static const String USERNAME = 'username';
  static const String PASSWORD = 'password';
  static const String NAME = 'NAME';
  static const String URL_AVATAR = 'url_avatar';

  static const String LIST_CITIES = 'list_cities';
  static const String LIST_ID_CITIES = 'list_id_cities';
  static const String LIST_TYPE = 'list_types_store';
  static const String DATE = 'date';

  ///Search
  static const String HISTORY_SEARCH = 'history_search';

  /// lưu lịch sử tìm kiếm chuyển bảo hành
  static const String HISTORY_SEARCH_CONVERT = 'history_search_convert';

  /// lưu lịch sử tìm kiếm  bảo hành
  static const String History_SEARCH_GUARANTY = 'history_search_guaranty';

  /// Preference
  static const String PREF_LANGUAGE = 'pref_language';

  static const String PREF_KEEP_LOGIN = 'pref_keep_login';

  static const String PREF_REMEMBER_ACCOUNT = 'pref_remember_account';

  static const String PREF_FINGERPRINT_LOGIN = 'pref_fingerprint_login';

  /// bảo hành
  static const ALL_GUARANTY = 5; //Tất cả
}
