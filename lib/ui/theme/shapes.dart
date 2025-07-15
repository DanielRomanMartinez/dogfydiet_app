import 'package:flutter/material.dart';

class Shapes {
  static const double gutter = 16.0;
  static const double gutterSmall = 8.0;
  static const double gutter2x = 32.0;
  static const double gutter3x = 48.0;
  static const double gutter4x = 64.0;

  static const double borderWidth = 1.0;
  static const double borderRadius = 12.0;
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;

  static const double appBarHeight = 72;
  static const double appBarElevation = 0.0;

  static const double buttonBorderWidth = borderWidth;
  static const BorderRadius buttonBorderRadius = BorderRadius.all(Radius.circular(borderRadius));
  static const BorderRadius buttonBorderRadiusSmall = BorderRadius.all(Radius.circular(borderRadiusSmall));
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0);
  static const EdgeInsets buttonPaddingLarge = EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0);

  static const double cardBorderWidth = 0.0;
  static const BorderRadius cardBorderRadius = BorderRadius.all(Radius.circular(borderRadiusLarge));
  static const double cardElevation = 4.0;
  static const EdgeInsets cardMargin = EdgeInsets.symmetric(horizontal: gutter, vertical: gutterSmall);
  static const EdgeInsets cardPadding = EdgeInsets.all(gutter);

  static const BorderRadius containerBorderRadius = BorderRadius.all(Radius.circular(borderRadius));
  static const EdgeInsets containerPadding = EdgeInsets.all(gutter);

  static const BoxShadow cardShadow = BoxShadow(
    color: Color(0x0F000000),
    blurRadius: 8.0,
    spreadRadius: 0.0,
    offset: Offset(0.0, 2.0),
  );

  static const BoxShadow elevatedShadow = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 12.0,
    spreadRadius: 0.0,
    offset: Offset(0.0, 4.0),
  );

  static const BoxShadow buttonShadow = BoxShadow(
    color: Color(0x26E85A4F),
    blurRadius: 8.0,
    spreadRadius: 0.0,
    offset: Offset(0.0, 2.0),
  );

  static const BorderRadius inputBorderRadius = BorderRadius.all(Radius.circular(borderRadius));
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(horizontal: gutter, vertical: 16.0);

  static const double dogfyIconSize = 24.0;
  static const double dogfyIconSizeSmall = 16.0;
  static const double dogfyIconSizeLarge = 32.0;

  static const double listSpacing = 12.0;
  static const double gridSpacing = 16.0;

  static const double cropperMargin = 16.0;

  static const double iconSize = 24.0;
  static const double iconSizeSmall = 20.0;
  static const double iconSizeLarge = 32.0;

  static const double dividerHeight = 1.0;
  static const double dividerIndent = gutter;

  static const BorderRadius fabBorderRadius = BorderRadius.all(Radius.circular(16.0));
  static const EdgeInsets fabPadding = EdgeInsets.all(16.0);

  static const BorderRadius priceBorderRadius = BorderRadius.all(Radius.circular(borderRadiusSmall));
  static const EdgeInsets pricePadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);

  static const BorderRadius offerBorderRadius = BorderRadius.all(Radius.circular(borderRadiusLarge));
  static const EdgeInsets offerPadding = EdgeInsets.all(gutter2x);
}
