import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
      ),

      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        titleLarge: AppTextStyles.titleLarge,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),

      cardTheme: const CardThemeData(
        color: AppColors.card,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,

      scaffoldBackgroundColor: const Color(0xFFF7F8FC),

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: Colors.white,
        error: AppColors.error,

        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF171A21),
        onError: Colors.white,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w800,
          height: 1.05,
          letterSpacing: -2.5,
          color: Color(0xFF111318),
        ),
        displayMedium: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          height: 1.1,
          letterSpacing: -1.5,
          color: Color(0xFF111318),
        ),
        headlineLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: Color(0xFF111318),
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.25,
          color: Color(0xFF111318),
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xFF171A21),
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.7,
          color: Color(0xFF555D6D),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
          color: Color(0xFF606878),
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Color(0xFF7A8292),
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
          color: Color(0xFF171A21),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        foregroundColor: Color(0xFF171A21),
      ),

      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      dividerTheme: const DividerThemeData(
        color: Color(0xFFE3E6ED),
        thickness: 1,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E3EA)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E3EA)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'app_colors.dart';
// import 'app_text_styles.dart';

// class AppTheme {
//   AppTheme._();

//   static ThemeData get darkTheme {
//     return ThemeData(
//       brightness: Brightness.dark,
//       useMaterial3: true,

//       scaffoldBackgroundColor: AppColors.background,

//       colorScheme: const ColorScheme.dark(
//         primary: AppColors.primary,
//         secondary: AppColors.secondary,
//         surface: AppColors.surface,
//         error: AppColors.error,
//       ),

//       textTheme: const TextTheme(
//         displayLarge: AppTextStyles.displayLarge,
//         displayMedium: AppTextStyles.displayMedium,
//         headlineLarge: AppTextStyles.headlineLarge,
//         headlineMedium: AppTextStyles.headlineMedium,
//         titleLarge: AppTextStyles.titleLarge,
//         bodyLarge: AppTextStyles.bodyLarge,
//         bodyMedium: AppTextStyles.bodyMedium,
//         bodySmall: AppTextStyles.bodySmall,
//         labelLarge: AppTextStyles.labelLarge,
//       ),

//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: false,
//       ),

//       cardTheme: const CardThemeData(
//         color: AppColors.card,
//         elevation: 0,
//         margin: EdgeInsets.zero,
//       ),

//       dividerTheme: const DividerThemeData(
//         color: AppColors.border,
//         thickness: 1,
//       ),

//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.surface,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.border),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.border),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
//         ),
//       ),
//     );
//   }

//   static ThemeData get lightTheme {
//     return ThemeData(
//       brightness: Brightness.light,
//       useMaterial3: true,
//       colorScheme: ColorScheme.fromSeed(
//         seedColor: AppColors.primary,
//         brightness: Brightness.light,
//       ),
//     );
//   }
// }
