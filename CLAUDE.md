# Project Context

I'm building a fake website for a course on UI/UX.

The site needs search, login, and other typical website features. It's a prototype/mock — no real backend needed.

We will target a mobile interface first. But try to use elements that will work for responsiveness on a desktop later.

# Tech Decisions Made

* Framework: Flutter - compiled to web via `flutter run -d chrome`
* Design system: Material 3 — built-in, no extra packages needed
* Routing: go_router — for proper URL-based navigation (/login, /search, /profile, etc.) so it feels like a real website
* State management: Riverpod — keep it light and simple.
* Data: Fake/hardcoded data in Dart files, no backend.

# Planned Pages for final deliverable

* Splash / landing page.
* Login + registration.
* Search with filters and results.
* Detail page for a search result.
* Profile / settings.

# Possible extras if time permits

* Dark/light theme toggle.
* Clean component structure (components/ folder with reusable widgets).
* Form validation on login/registration using TextFormField validators.
* Maybe try "Widgetbook" to see all the separate components
* Integrate a way to implement i18n for the components, probably using "slang"

# Tooling 

After making changes please check for errors by running:

    $ flutter analyze
    $ flutter test
    $ flutter build web
    $ dart format


# Refix Website — Project Summary

## Stack
- Flutter web (`flutter run -d chrome`)
- Material 3 (`useMaterial3: true`)
- go_router for URL routing
- flutter_riverpod for state
- google_fonts (Averia Serif Libre titles + Barlow body, switchable)
- flex_color_picker ^3.6.0 for seed color picking (tap card → wheel picker dialog)

## Design System
- **Primary**: Warm orange/terracotta — default `#E07030`
- **Secondary**: Warm amber/brown — default `#A05520`
- **Tertiary**: Rose/crimson — default `#C03040`
- **Title font**: Averia Serif Libre (switchable)
- **Body font**: Barlow (switchable)

## Theme Architecture
All theme state flows through `appThemeProvider` (derived Riverpod Provider):
- Watches: primaryColorProvider, secondaryColorProvider, tertiaryColorProvider, titleFontProvider, bodyFontProvider
- Returns: `({ThemeData light, ThemeData dark})`
- `main.dart` watches only `appThemeProvider` — single watch point at root

## Key Files
- `lib/main.dart` — ConsumerWidget, watches appThemeProvider
- `lib/theme/app_colors.dart` — AppColors class, 3 default seed Color constants only
- `lib/theme/app_fonts.dart` — font lists + buildTextTheme(title, body)
- `lib/theme/app_theme.dart` — appThemeProvider (derived Provider → ThemeData light+dark)
- `lib/providers/color_providers.dart` — primaryColorProvider, secondaryColorProvider, tertiaryColorProvider
- `lib/providers/font_providers.dart` — titleFontProvider, bodyFontProvider
- `lib/router/app_router.dart` — appRouter (GoRouter)
- `lib/screens/fonts_screen.dart` — font picker cards + type scale preview
- `lib/screens/colors_screen.dart` — color picker cards + tonal palette + role chips

## Planned Pages (TODO)
- `/` — Splash / landing
- `/login` + `/register` — auth forms
- `/search` — search with filters
- `/detail/:id` — result detail
- `/profile` — profile/settings