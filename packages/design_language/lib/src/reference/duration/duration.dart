import 'package:design_language/src/reference/duration/duration_design_system.dart';

class Duration implements DurationDesignSystem {
  final int _base;
  final int _shortGap;
  final int _mediumGap;
  final int _longGap;
  final int _extraLongGap;

  Duration({
    int? base = 50,
    int? shortGap = 50,
    int? mediumGap = 50,
    int? longGap = 50,
    int? extraLongGap = 100,
  })  : _base = base!,
        _shortGap = shortGap!,
        _mediumGap = mediumGap!,
        _longGap = longGap!,
        _extraLongGap = extraLongGap!;

  @override
  int get short1 => _base;
  @override
  int get short2 => short1 + _shortGap;
  @override
  int get short3 => short2 + _shortGap;
  @override
  int get short4 => short3 + _shortGap;

  @override
  int get medium1 => short4 + _mediumGap;
  @override
  int get medium2 => medium1 + _mediumGap;
  @override
  int get medium3 => medium2 + _mediumGap;
  @override
  int get medium4 => medium3 + _mediumGap;

  @override
  int get long1 => medium4 + _longGap;
  @override
  int get long2 => long1 + _longGap;
  @override
  int get long3 => long2 + _longGap;
  @override
  int get long4 => long3 + _longGap;

  @override
  int get extraLong1 => long4 + _extraLongGap;
  @override
  int get extraLong2 => extraLong1 + _extraLongGap;
  @override
  int get extraLong3 => extraLong2 + _extraLongGap;
  @override
  int get extraLong4 => extraLong3 + _extraLongGap;
}
