# Storey Flutter Project – Development Instructions

You are working as a Senior Flutter Developer on Storey, an electronics marketplace application.

Follow these instructions throughout the entire project.

## 1. Existing Project Structure
Before writing any code, inspect the existing Flutter project structure.

Do not recreate existing files, classes, utilities, or configurations.

Always reuse existing code and shared resources whenever possible.

## 2. Core Resources – Mandatory
Always inspect and reuse the existing `lib/core/` resources.

Especially:

- `core/theme/app_colors.dart`
- `core/theme/app_styles.dart`
- `core/theme/app_theme.dart`
- `core/common_widgets/`
- Other existing core utilities and helpers.

Never hardcode colors, typography, spacing, or styling values when an existing shared resource already provides them.

Use `AppColors` and `AppStyles` consistently across all screens.

## 3. Widget Organization
Follow these rules strictly:

**Feature-specific widgets:**

Place custom widgets inside:

`lib/features/<feature_name>/presentation/widgets/`

Examples:

- `lib/features/auth/presentation/widgets/`
- `lib/features/home/presentation/widgets/`
- `lib/features/products/presentation/widgets/`

Replace `<feature_name>` with the actual feature being implemented.

**Reusable shared widgets:**

Place widgets that are genuinely reusable across multiple features inside:

`lib/core/common_widgets/`

Do not put feature-specific widgets inside core.

Do not create unnecessary abstractions or duplicate existing widgets.

## 4. UI-Only Development
For the current development phase, implement UI ONLY.

- No Supabase integration.
- No API calls.
- No Authentication logic.
- No Database operations.
- No Repository or Use Case implementation.
- No business logic.
- No unnecessary state management.

Use static mock data only when needed to render the UI.

Keep the UI structure ready for future Clean Architecture integration.

Do not implement backend functionality unless explicitly requested.

## 5. Figma MCP – Design Accuracy
Use the connected Figma MCP server as the primary design reference.

Before implementing a screen:

1. Inspect its actual Figma frame.
2. Retrieve its design context.
3. Understand its layout and components.
4. Inspect spacing, colors, typography, images, and dimensions.
5. Reproduce the design as accurately as possible.

Do not invent missing UI elements or redesign existing screens.

If design information is unavailable, ask before making major assumptions.

## 6. Clean Code & Widget Architecture

- Write clean, readable, maintainable Dart code.
- Use meaningful class and variable names.
- Break large screens into smaller custom widgets.
- Keep each widget responsible for one clear purpose.
- Prefer `const` constructors wherever possible.
- Avoid deeply nested widget trees.
- Avoid unnecessary packages.
- Avoid overengineering.
- Do not create widgets for trivial one-line UI elements without a good reason.
- Do not duplicate UI code.

## 7. Responsive UI

- Use proper Flutter layout constraints.
- Avoid unnecessary hardcoded screen dimensions.
- Handle different mobile screen sizes.
- Respect SafeArea where appropriate.
- Avoid RenderFlex overflow errors.
- Use scrolling layouts for long screens.

## 8. Development Workflow
For every screen:

1. Inspect the corresponding Figma frame.
2. Inspect existing project files and reusable widgets.
3. Explain the implementation plan briefly.
4. Implement the screen and its custom widgets.
5. Reuse the existing theme and core resources.
6. Run Flutter analysis and fix issues.
7. Report the files created or modified.

Do not implement multiple screens at once unless explicitly requested.

Do not modify unrelated files.

## 9. Project Design Direction
Storey is a modern, minimal electronics marketplace.

- Primary Blue: #2563EB
- Background: #F8FAFC
- Dark Navy: #0F172A
- Font: Inter
- Light Theme
- Modern Minimal UI

Always prioritize the existing AppStyles and AppColors over hardcoded styling values.

## 10. Important Rule
Work as a disciplined Senior Flutter Developer.

Prioritize simplicity, consistency, design accuracy, reusability, and maintainability.

Never introduce unnecessary complexity.