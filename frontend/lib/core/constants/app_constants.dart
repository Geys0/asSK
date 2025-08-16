import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'asSK Connect';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Next-generation local gigs & bounties platform';
  
  // API Configuration
  static const String baseUrl = 'http://localhost:5000';
  static const String apiVersion = '/api/v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Real-time Configuration
  static const String signalRHub = '/hubs/main';
  static const Duration reconnectInterval = Duration(seconds: 5);
  
  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 4.0;
  
  // Task Categories
  static const List<String> taskCategories = [
    'Delivery',
    'Cleaning',
    'Repair',
    'Tutoring',
    'Pet Care',
    'Gardening',
    'Moving',
    'Photography',
    'Design',
    'Other'
  ];
  
  // Task Status
  static const String statusOpen = 'Open';
  static const String statusAccepted = 'Accepted';
  static const String statusInProgress = 'InProgress';
  static const String statusCompleted = 'Completed';
  static const String statusCancelled = 'Cancelled';
  
  // Review Ratings
  static const int minRating = 1;
  static const int maxRating = 5;
  
  // Location Constants
  static const double defaultRadiusKm = 10.0;
  static const double maxRadiusKm = 50.0;
  static const double minRadiusKm = 1.0;
}

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF00D4FF); // Soft Aqua
  static const Color primaryLight = Color(0xFF4DDFFF);
  static const Color primaryDark = Color(0xFF0099CC);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF6366F1); // Modern Purple
  static const Color secondaryLight = Color(0xFF8B8DFF);
  static const Color secondaryDark = Color(0xFF4F46E5);
  
  // Accent Colors
  static const Color accent = Color(0xFF10B981); // Muted Green
  static const Color accentLight = Color(0xFF34D399);
  static const Color accentDark = Color(0xFF059669);
  
  // Neutral Colors
  static const Color neutral = Color(0xFF6B7280); // Cool Gray
  static const Color neutralLight = Color(0xFF9CA3AF);
  static const Color neutralDark = Color(0xFF374151);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF111827);
  static const Color surfaceLight = Color(0xFFF9FAFB);
  static const Color surfaceDark = Color(0xFF1F2937);
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Text Colors
  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFFD1D5DB);
  
  // Border Colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF374151);
  
  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x4D000000);
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [AppColors.secondary, AppColors.secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [AppColors.accent, AppColors.accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [AppColors.backgroundLight, AppColors.surfaceLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class AppShadows {
  static const List<BoxShadow> small = [
    BoxShadow(
      color: AppColors.shadowLight,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];
  
  static const List<BoxShadow> medium = [
    BoxShadow(
      color: AppColors.shadowLight,
      offset: Offset(0, 4),
      blurRadius: 8,
    ),
  ];
  
  static const List<BoxShadow> large = [
    BoxShadow(
      color: AppColors.shadowLight,
      offset: Offset(0, 8),
      blurRadius: 16,
    ),
  ];
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  
  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  );
  
  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  
  static const TextStyle headline4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  
  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}
