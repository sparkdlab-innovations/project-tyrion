import 'package:flutter/widgets.dart';

abstract class CornerDesignSystem {
  BorderRadius get none;

  BorderRadius get extraSmall;
  BorderRadius get extraSmallTop;

  BorderRadius get small;

  BorderRadius get medium;

  BorderRadius get large;
  BorderRadius get largeEnd;
  BorderRadius get largeTop;

  BorderRadius get extraLarge;
  BorderRadius get extraLargeTop;

  BorderRadius get circle;
}
