
class Model {
  String title;
  Model(this.title);
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(json['title']);
  }
}

class FetchState {}

class Loading extends FetchState{
  Loading();
}

class Fetched extends FetchState{
  dynamic data;
  Fetched(this.data);
}

class Error extends FetchState{
  Exception error;
  Error(this.error);
}


