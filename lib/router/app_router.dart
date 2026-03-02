import 'package:go_router/go_router.dart';
import '../screens/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    // TODO: add /login, /register, /search, /detail/:id, /profile
  ],
);
