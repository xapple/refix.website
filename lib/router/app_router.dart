import 'package:go_router/go_router.dart';
import '../screens/colors_screen.dart';
import '../screens/fonts_screen.dart';
import '../screens/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/fonts', builder: (context, state) => const FontsScreen()),
    GoRoute(path: '/colors', builder: (context, state) => const ColorsScreen()),
    // TODO: add /login, /register, /search, /detail/:id, /profile
  ],
);
