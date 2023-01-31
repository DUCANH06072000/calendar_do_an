class InputError {
  late int statusCode;
  late String message;
  late List<Data> data;

  InputError();

  InputError.fromJson(dynamic json) {
    statusCode = json['statusCode'] ?? 0;
    message = json['message'] ?? "";
    try{
      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data.add(Data.fromJson(v));
        });
      }
    }catch(e){
      data = <Data>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'InputError{statusCode: $statusCode, message: $message, data: $data}';
  }
}

class Data {
  late String field;
  late String error;

  Data();

  Data.fromJson(Map<String, dynamic> json) {
    field = json['field'] ?? "";
    error = json['error'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = this.field;
    data['error'] = this.error;
    return data;
  }

  @override
  String toString() {
    return 'Data{field: $field, error: $error}';
  }
}