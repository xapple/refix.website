import 'package:go_router/go_router.dart';
import '../screens/colors_screen.dart';
import '../screens/craftsman_screen.dart';
import '../screens/fonts_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/fonts', builder: (context, state) => const FontsScreen()),
    GoRoute(path: '/colors', builder: (context, state) => const ColorsScreen()),
    GoRoute(path: '/search', builder: (context, state) => const SearchScreen()),
    GoRoute(
      path: '/craftsman/:id',
      builder: (context, state) =>
          CraftsmanScreen(craftsmanId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
