import 'package:dogfydiet_app/ui/theme/colors_map.dart';
import 'package:dogfydiet_app/ui/theme/fonts.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    canvasColor: ColorsMap.backgroundColor,
    scaffoldBackgroundColor: ColorsMap.backgroundColor,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorsMap.primaryColor,
      onPrimary: ColorsMap.onPrimaryColor,
      primaryContainer: ColorsMap.secondaryColor,
      onPrimaryContainer: ColorsMap.textPrimaryColor,
      secondary: ColorsMap.secondaryColor,
      onSecondary: ColorsMap.onSecondaryColor,
      secondaryContainer: ColorsMap.dogfyTeal,
      onSecondaryContainer: ColorsMap.textPrimaryColor,
      tertiary: ColorsMap.accentColor,
      onTertiary: ColorsMap.onPrimaryColor,
      tertiaryContainer: ColorsMap.dogfyYellow,
      onTertiaryContainer: ColorsMap.textPrimaryColor,
      error: ColorsMap.errorColor,
      onError: ColorsMap.onErrorColor,
      errorContainer: Color(0xFFFFEDEA),
      onErrorContainer: ColorsMap.errorColor,
      surface: ColorsMap.surfaceColor,
      onSurface: ColorsMap.onSurfaceColor,
      surfaceContainerHighest: ColorsMap.cardBackgroundColor,
      onSurfaceVariant: ColorsMap.textSecondaryColor,
      outline: ColorsMap.dividerColor,
      outlineVariant: ColorsMap.neutral200,
      shadow: Colors.black26,
      scrim: Colors.black54,
      inverseSurface: ColorsMap.neutral600,
      onInverseSurface: ColorsMap.neutralWhite,
      inversePrimary: ColorsMap.primaryColor,
      surfaceTint: ColorsMap.primaryColor,
    ),
    fontFamily: Fonts.fontFamily,
    textTheme: const TextTheme(
      displayLarge: Fonts.displayLargeTextStyle,
      displayMedium: Fonts.displayMediumTextStyle,
      displaySmall: Fonts.displaySmallTextStyle,
      headlineLarge: Fonts.headlineLargeTextStyle,
      headlineMedium: Fonts.headlineMediumTextStyle,
      headlineSmall: Fonts.headlineSmallTextStyle,
      titleLarge: Fonts.titleLargeTextStyle,
      titleMedium: Fonts.titleMediumTextStyle,
      titleSmall: Fonts.titleSmallTextStyle,
      bodyLarge: Fonts.bodyLargeTextStyle,
      bodyMedium: Fonts.bodyMediumTextStyle,
      bodySmall: Fonts.bodySmallTextStyle,
      labelLarge: Fonts.labelLargeTextStyle,
      labelMedium: Fonts.labelMediumTextStyle,
      labelSmall: Fonts.labelSmallTextStyle,
    ),
    iconTheme: const IconThemeData(
      color: ColorsMap.iconColor,
      size: Shapes.iconSize,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsMap.backgroundColor,
      foregroundColor: ColorsMap.textPrimaryColor,
      elevation: Shapes.appBarElevation,
      centerTitle: true,
      titleTextStyle: Fonts.titleLargeTextStyle,
      iconTheme: IconThemeData(
        color: ColorsMap.iconColor,
        size: Shapes.iconSize,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsMap.primaryColor,
        foregroundColor: ColorsMap.onPrimaryColor,
        disabledBackgroundColor: ColorsMap.neutral200,
        disabledForegroundColor: ColorsMap.neutral400,
        elevation: 2,
        shadowColor: Colors.black26,
        shape: const RoundedRectangleBorder(
          borderRadius: Shapes.buttonBorderRadius,
        ),
        padding: Shapes.buttonPadding,
        textStyle: Fonts.dogfyButtonTextStyle,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsMap.primaryColor,
        disabledForegroundColor: ColorsMap.neutral400,
        shape: const RoundedRectangleBorder(
          borderRadius: Shapes.buttonBorderRadiusSmall,
        ),
        padding: Shapes.buttonPaddingSmall,
        textStyle: Fonts.labelMediumTextStyle,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorsMap.primaryColor,
        disabledForegroundColor: ColorsMap.neutral400,
        side: const BorderSide(
          color: ColorsMap.primaryColor,
          width: Shapes.borderWidth,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: Shapes.buttonBorderRadius,
        ),
        padding: Shapes.buttonPadding,
        textStyle: Fonts.dogfyButtonTextStyle.copyWith(
          color: ColorsMap.primaryColor,
        ),
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: Shapes.cardElevation,
      color: ColorsMap.surfaceColor,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: Shapes.cardBorderRadius,
      ),
      margin: Shapes.cardMargin,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsMap.surfaceColor,
      border: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.neutral200,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.neutral200,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.primaryColor,
          width: 2.0,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.errorColor,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.errorColor,
          width: 2.0,
        ),
      ),
      contentPadding: Shapes.inputPadding,
      hintStyle: Fonts.bodyMediumTextStyle.copyWith(
        color: ColorsMap.neutral400,
      ),
      labelStyle: Fonts.bodyMediumTextStyle.copyWith(
        color: ColorsMap.textSecondaryColor,
      ),
    ),
    dividerTheme: const DividerThemeData(
      thickness: Shapes.dividerHeight,
      color: ColorsMap.dividerColor,
      indent: Shapes.dividerIndent,
      endIndent: Shapes.dividerIndent,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsMap.primaryColor,
      selectionColor: Color(0x40E85A4F),
      selectionHandleColor: ColorsMap.primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsMap.primaryColor,
      foregroundColor: ColorsMap.onPrimaryColor,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: Shapes.fabBorderRadius,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.primaryColor;
        }
        return null;
      }),
      checkColor: WidgetStateProperty.all(ColorsMap.onPrimaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.primaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.primaryColor;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.primaryColor.withValues(alpha: 0.5);
        }
        return null;
      }),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorsMap.primaryColor,
      linearTrackColor: ColorsMap.neutral200,
      circularTrackColor: ColorsMap.neutral200,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    canvasColor: ColorsMap.darkBackgroundColor,
    scaffoldBackgroundColor: ColorsMap.darkBackgroundColor,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: ColorsMap.darkPrimaryColor,
      onPrimary: ColorsMap.onDarkPrimaryColor,
      primaryContainer: ColorsMap.darkSecondaryColor,
      onPrimaryContainer: ColorsMap.onDarkPrimaryColor,
      secondary: ColorsMap.darkSecondaryColor,
      onSecondary: ColorsMap.onDarkSecondaryColor,
      secondaryContainer: ColorsMap.darkDogfyTeal,
      onSecondaryContainer: ColorsMap.neutral900,
      tertiary: ColorsMap.darkAccentColor,
      onTertiary: ColorsMap.onDarkPrimaryColor,
      tertiaryContainer: ColorsMap.darkDogfyYellow,
      onTertiaryContainer: ColorsMap.neutral900,
      error: ColorsMap.darkErrorColor,
      onError: ColorsMap.onDarkErrorColor,
      errorContainer: Color(0xFF422B2B),
      onErrorContainer: ColorsMap.darkErrorColor,
      surface: ColorsMap.darkSurfaceColor,
      onSurface: ColorsMap.onDarkSurfaceColor,
      surfaceContainerHighest: ColorsMap.darkCardBackgroundColor,
      onSurfaceVariant: ColorsMap.darkTextSecondaryColor,
      outline: ColorsMap.darkDividerColor,
      outlineVariant: ColorsMap.neutral700,
      shadow: Colors.black87,
      scrim: Colors.black87,
      inverseSurface: ColorsMap.neutral100,
      onInverseSurface: ColorsMap.neutral900,
      inversePrimary: ColorsMap.primaryColor,
      surfaceTint: ColorsMap.darkPrimaryColor,
    ),
    fontFamily: Fonts.fontFamily,
    textTheme: TextTheme(
      displayLarge: Fonts.displayLargeTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      displayMedium: Fonts.displayMediumTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      displaySmall: Fonts.displaySmallTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      headlineLarge: Fonts.headlineLargeTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      headlineMedium: Fonts.headlineMediumTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      headlineSmall: Fonts.headlineSmallTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      titleLarge: Fonts.titleLargeTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      titleMedium: Fonts.titleMediumTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      titleSmall: Fonts.titleSmallTextStyle.copyWith(color: ColorsMap.darkTextSecondaryColor),
      bodyLarge: Fonts.bodyLargeTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      bodyMedium: Fonts.bodyMediumTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      bodySmall: Fonts.bodySmallTextStyle.copyWith(color: ColorsMap.darkTextSecondaryColor),
      labelLarge: Fonts.labelLargeTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      labelMedium: Fonts.labelMediumTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      labelSmall: Fonts.labelSmallTextStyle.copyWith(color: ColorsMap.darkTextSecondaryColor),
    ),
    iconTheme: const IconThemeData(
      color: ColorsMap.darkIconColor,
      size: Shapes.iconSize,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsMap.darkBackgroundColor,
      foregroundColor: ColorsMap.darkTextPrimaryColor,
      elevation: Shapes.appBarElevation,
      centerTitle: true,
      titleTextStyle: Fonts.titleLargeTextStyle.copyWith(color: ColorsMap.darkTextPrimaryColor),
      iconTheme: const IconThemeData(
        color: ColorsMap.darkIconColor,
        size: Shapes.iconSize,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsMap.darkPrimaryColor,
        foregroundColor: ColorsMap.onDarkPrimaryColor,
        disabledBackgroundColor: ColorsMap.neutral800,
        disabledForegroundColor: ColorsMap.neutral400,
        elevation: 2,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          borderRadius: Shapes.buttonBorderRadius,
        ),
        padding: Shapes.buttonPadding,
        textStyle: Fonts.dogfyButtonTextStyle.copyWith(color: ColorsMap.onDarkPrimaryColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsMap.darkPrimaryColor,
        disabledForegroundColor: ColorsMap.neutral500,
        shape: const RoundedRectangleBorder(
          borderRadius: Shapes.buttonBorderRadiusSmall,
        ),
        padding: Shapes.buttonPaddingSmall,
        textStyle: Fonts.labelMediumTextStyle.copyWith(color: ColorsMap.darkPrimaryColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorsMap.darkPrimaryColor,
        disabledForegroundColor: ColorsMap.neutral500,
        side: const BorderSide(
          color: ColorsMap.darkPrimaryColor,
          width: Shapes.borderWidth,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: Shapes.buttonBorderRadius,
        ),
        padding: Shapes.buttonPadding,
        textStyle: Fonts.dogfyButtonTextStyle.copyWith(color: ColorsMap.darkPrimaryColor),
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: Shapes.cardElevation,
      color: ColorsMap.darkSurfaceColor,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: Shapes.cardBorderRadius,
      ),
      margin: Shapes.cardMargin,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsMap.darkSurfaceColor,
      border: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.neutral700,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.neutral700,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.darkPrimaryColor,
          width: 2.0,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.darkErrorColor,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: Shapes.inputBorderRadius,
        borderSide: BorderSide(
          color: ColorsMap.darkErrorColor,
          width: 2.0,
        ),
      ),
      contentPadding: Shapes.inputPadding,
      hintStyle: Fonts.bodyMediumTextStyle.copyWith(
        color: ColorsMap.neutral400,
      ),
      labelStyle: Fonts.bodyMediumTextStyle.copyWith(
        color: ColorsMap.darkTextSecondaryColor,
      ),
    ),
    dividerTheme: const DividerThemeData(
      thickness: Shapes.dividerHeight,
      color: ColorsMap.darkDividerColor,
      indent: Shapes.dividerIndent,
      endIndent: Shapes.dividerIndent,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsMap.darkPrimaryColor,
      selectionColor: Color(0x40FF6B5B),
      selectionHandleColor: ColorsMap.darkPrimaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsMap.darkPrimaryColor,
      foregroundColor: ColorsMap.onDarkPrimaryColor,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: Shapes.fabBorderRadius,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.darkPrimaryColor;
        }
        return null;
      }),
      checkColor: WidgetStateProperty.all(ColorsMap.onDarkPrimaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.darkPrimaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.darkPrimaryColor;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsMap.darkPrimaryColor.withValues(alpha: 0.5);
        }
        return null;
      }),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorsMap.darkPrimaryColor,
      linearTrackColor: ColorsMap.neutral800,
      circularTrackColor: ColorsMap.neutral800,
    ),
  );
}
