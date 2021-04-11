import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/constants/size_constants.dart';
import 'package:taskie/presentation/utils/extensions/size_extensions.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline7 => _poppinsTextTheme.headline6.copyWith(
        fontSize: Sizes.dimen_22.sp,
        color: AppColors.offOrangeColor,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: AppColors.offRedColor,
      );

  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: AppColors.primarySoft,
      );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1.copyWith(
        fontSize: Sizes.dimen_18.sp,
        color: AppColors.darkGrey,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get whiteSubtitle2 => _poppinsTextTheme.subtitle1.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get whiteSubtitle3 => _poppinsTextTheme.subtitle1.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: AppColors.primarySoft,
      );

  static TextStyle get _whiteButton => _poppinsTextTheme.button.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
      );

  static TextStyle get _activityText => _poppinsTextTheme.button.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: AppColors.offRedColor,
      );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2.copyWith(
        color: Colors.white,
        fontSize: Sizes.dimen_14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        headline1: _whiteHeadline7,
        subtitle1: whiteSubtitle1,
        headline3: _activityText,
        subtitle2: whiteSubtitle2,
        bodyText2: whiteBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => subtitle1.copyWith(
        color: Colors.grey,
      );

  TextStyle get violetHeadline6 => headline6.copyWith(
        color: AppColors.darkGrey,
      );

  TextStyle get vulcanBodyText2 => bodyText2.copyWith(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greyCaption => caption.copyWith(
        color: Colors.grey,
      );

  TextStyle get orangeSubtitle1 => subtitle1.copyWith(
        color: Colors.orangeAccent,
      );
}
