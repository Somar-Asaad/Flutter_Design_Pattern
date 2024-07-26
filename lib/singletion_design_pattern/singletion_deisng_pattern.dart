class Singleton1 {
  static Singleton1? _instance;

  Singleton1._internal();

  static Singleton1 get instance {
    _instance ??= Singleton1._internal();
    return _instance!;
  }
}

class Singleton2 {
  static Singleton2? _instance;
  Singleton2._internal();

  static  Singleton2 getInstance () {
    _instance ??= Singleton2._internal();
    return _instance!;
  }
}

class Singleton3 {
  static Singleton3? _instance;
  Singleton3._internal();

  factory Singleton3 () {
    _instance ?? Singleton2._internal();
    return _instance!;
  }
}