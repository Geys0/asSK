import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:assk_connect/features/auth/presentation/screens/login_screen.dart';
import 'package:assk_connect/features/auth/presentation/screens/signup_screen.dart';
import 'package:assk_connect/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:assk_connect/features/tasks/presentation/screens/task_detail_screen.dart';
import 'package:assk_connect/features/tasks/presentation/screens/post_task_screen.dart';
import 'package:assk_connect/features/profile/presentation/screens/profile_screen.dart';
import 'package:assk_connect/features/chat/presentation/screens/chat_screen.dart';
import 'package:assk_connect/features/reviews/presentation/screens/reviews_screen.dart';
import 'package:assk_connect/shared/widgets/main_layout.dart';

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/';
  static const String tasks = '/tasks';
  static const String taskDetail = '/tasks/:id';
  static const String postTask = '/post-task';
  static const String profile = '/profile';
  static const String chat = '/chat';
  static const String reviews = '/reviews';
  
  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      // Auth Routes
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignupScreen(),
      ),
      
      // Main App Routes
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => const TasksScreen(),
          ),
          GoRoute(
            path: tasks,
            builder: (context, state) => const TasksScreen(),
          ),
          GoRoute(
            path: taskDetail,
            builder: (context, state) {
              final taskId = state.pathParameters['id']!;
              return TaskDetailScreen(taskId: taskId);
            },
          ),
          GoRoute(
            path: postTask,
            builder: (context, state) => const PostTaskScreen(),
          ),
          GoRoute(
            path: profile,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: chat,
            builder: (context, state) => const ChatScreen(),
          ),
          GoRoute(
            path: reviews,
            builder: (context, state) => const ReviewsScreen(),
          ),
        ],
      ),
    ],
    
    // Error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
    
    // Redirect logic for authentication
    redirect: (context, state) {
      // TODO: Implement authentication redirect logic
      // For now, allow all routes
      return null;
    },
  );
}
