import 'package:cinnamon_riverpod_2/theme/colors/dark_app_colors.dart';
import 'package:cinnamon_riverpod_2/theme/colors/light_app_colors.dart';
import 'package:cinnamon_riverpod_2/theme/styles/dark_app_text_styles.dart';
import 'package:cinnamon_riverpod_2/theme/styles/light_app_text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final appTheme = AppTheme();

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    primaryColor: lightAppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    /// BUTTONS
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: lightAppColors.primaryColor,
        foregroundColor: lightAppColors.primaryColorDark,
        disabledBackgroundColor: lightAppColors.neutrals100,
        disabledForegroundColor: lightAppColors.neutrals300,
        textStyle: lightAppTextStyles.primaryButtonTextStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        splashFactory:
            defaultTargetPlatform == TargetPlatform.android ? InkSparkle.splashFactory : NoSplash.splashFactory,
      ),
    ),

    /// SPLASHES
    splashFactory: defaultTargetPlatform == TargetPlatform.android ? InkSparkle.splashFactory : NoSplash.splashFactory,
    splashColor: lightAppColors.tertiaryColor,

    textTheme: TextTheme(
      titleMedium: lightAppTextStyles.titleMediumTextStyle,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    primaryColor: darkAppColors.primaryColor,

    scaffoldBackgroundColor: Colors.black,
    dialogBackgroundColor: Colors.black,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    /// BUTTONS
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: darkAppColors.primaryColor,
        foregroundColor: lightAppColors.primaryColorDark,
        disabledBackgroundColor: lightAppColors.neutrals700,
        disabledForegroundColor: lightAppColors.neutrals800,
        textStyle: darkAppTextStyles.primaryButtonTextStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        splashFactory:
            defaultTargetPlatform == TargetPlatform.android ? InkSparkle.splashFactory : NoSplash.splashFactory,
      ),
    ),

    /// SPLASHES
    splashFactory: defaultTargetPlatform == TargetPlatform.android ? InkSparkle.splashFactory : NoSplash.splashFactory,
    splashColor: darkAppColors.tertiaryColor,

    textTheme: TextTheme(
      titleMedium: darkAppTextStyles.titleMediumTextStyle,
    ),
  );
}
