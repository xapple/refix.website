# Project Context

I'm building a fake website for a course on UI/UX.

The site needs search, login, and other typical website features. It's a prototype/mock — no real backend needed.

We will target a mobile interface first. But try to use elements that will work for responsiveness on a desktop later.

# Tech Decisions Made

Framework: Flutter (compiled to web via flutter run -d chrome)

Design system: Material 3 (useMaterial3: true in ThemeData) — built-in, no extra packages needed

Routing: go_router — for proper URL-based navigation (/login, /search, /profile, etc.) so it feels like a real website

State management: Riverpod — keep it light and simple.

Data: Fake/hardcoded data in Dart files, no backend.

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

# Coding standards.

When making list like this one:

    return base.copyWith(
      displayLarge: titleStyle(base.displayLarge),
      displayMedium: titleStyle(base.displayMedium),
      displaySmall: titleStyle(base.displaySmall),
      headlineVeryLarge: titleStyle(base.headlineLarge),

Please align the items with whitespace like this:

    return base.copyWith(
      displayLarge:      titleStyle(base.displayLarge),
      displayMedium:     titleStyle(base.displayMedium),
      displaySmall:      titleStyle(base.displaySmall),
      headlineVeryLarge: titleStyle(base.headlineLarge),