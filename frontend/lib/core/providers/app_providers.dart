import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:assk_connect/core/routing/app_router.dart';

// Theme Mode Provider
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

// App Router Provider
final appRouterProvider = Provider<GoRouter>((ref) => AppRouter.router);

// App State Provider
final appStateProvider = StateProvider<AppState>((ref) => AppState.initial);

// Loading State Provider
final isLoadingProvider = StateProvider<bool>((ref) => false);

// Error State Provider
final errorProvider = StateProvider<String?>((ref) => null);

// App State Enum
enum AppState {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

// App State Notifier
class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState.initial);

  void setLoading() => state = AppState.loading;
  void setAuthenticated() => state = AppState.authenticated;
  void setUnauthenticated() => state = AppState.unauthenticated;
  void setError() => state = AppState.error;
  void reset() => state = AppState.initial;
}

// App State Provider
final appStateNotifierProvider = StateNotifierProvider<AppStateNotifier, AppState>(
  (ref) => AppStateNotifier(),
);

// User Provider
final userProvider = StateProvider<User?>((ref) => null);

// User Model
class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final DateTime createdAt;
  final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    required this.createdAt,
    this.isVerified = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isVerified: json['isVerified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'createdAt': createdAt.toIso8601String(),
      'isVerified': isVerified,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? createdAt,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

// Location Provider
final locationProvider = StateProvider<Location?>((ref) => null);

// Location Model
class Location {
  final double latitude;
  final double longitude;
  final String? address;

  Location({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }
}

// Task Filter Provider
final taskFilterProvider = StateProvider<TaskFilter>((ref) => TaskFilter());

// Task Filter Model
class TaskFilter {
  final String? category;
  final double? radius;
  final double? minPrice;
  final double? maxPrice;
  final String? status;
  final Location? location;

  TaskFilter({
    this.category,
    this.radius,
    this.minPrice,
    this.maxPrice,
    this.status,
    this.location,
  });

  TaskFilter copyWith({
    String? category,
    double? radius,
    double? minPrice,
    double? maxPrice,
    String? status,
    Location? location,
  }) {
    return TaskFilter(
      category: category ?? this.category,
      radius: radius ?? this.radius,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      status: status ?? this.status,
      location: location ?? this.location,
    );
  }
}

// Notification Provider
final notificationProvider = StateProvider<List<AppNotification>>((ref) => []);

// Notification Model
class AppNotification {
  final String id;
  final String title;
  final String message;
  final String type;
  final DateTime createdAt;
  final bool isRead;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
    };
  }

  AppNotification copyWith({
    String? id,
    String? title,
    String? message,
    String? type,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
