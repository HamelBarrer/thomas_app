abstract class Either<L, R> {
  const Either();

  bool get isLeft;
  bool get isRight;

  L get left;
  R get right;

  T fold<T>(T Function(L) leftFn, T Function(R) rightFn);

  T when<T>({required T Function(L) left, required T Function(R) right}) =>
      fold(left, right);
}

class Left<L, R> extends Either<L, R> {
  final L _value;
  const Left(this._value);

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  L get left => _value;

  @override
  R get right => throw Exception('Cannot get right value from Left');

  @override
  T fold<T>(T Function(L) leftFn, T Function(R) rightFn) => leftFn(_value);

  @override
  String toString() => 'Left($_value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Left<L, R> &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R _value;
  const Right(this._value);

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  L get left => throw Exception('Cannot get left value from Right');

  @override
  R get right => _value;

  @override
  T fold<T>(T Function(L) leftFn, T Function(R) rightFn) => rightFn(_value);

  @override
  String toString() => 'Right($_value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Right<L, R> &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
