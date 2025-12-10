import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/theme/extensions/theme_extensions.dart';

import '../domain/entities/app_theme_entity.dart';
import 'manager/theme_cubit/theme_cubit.dart' show ThemeCubit;
import 'manager/theme_cubit/theme_state.dart';

class DisplayThemeView extends StatelessWidget {
  const DisplayThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Display"), centerTitle: true),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.read<ThemeCubit>();
          final currentMode = state is ThemeLoaded
              ? state.themeMode
              : AppThemeMode.system;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _ThemeOptionCard(
                      label: "Light",
                      image: "",
                      selected: currentMode == AppThemeMode.light,
                      onTap: () =>
                          themeCubit.changeTheme(AppThemeMode.light),
                    ),
                    _ThemeOptionCard(
                      label: "Dark",
                      image: "",
                      selected: currentMode == AppThemeMode.dark,
                      onTap: () =>
                          themeCubit.changeTheme(AppThemeMode.dark),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Use device settings",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Switch.adaptive(
                          value: currentMode == AppThemeMode.system,
                          onChanged: (value) {
                            themeCubit.changeTheme(
                              value
                                  ? AppThemeMode.system
                                  : AppThemeMode.light,
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      "Match appearance to your device's Display & Brightness settings.",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  const _ThemeOptionCard({
    required this.label,
    required this.image,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String image;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected
                    ? context.colors.primary
                    : Colors.grey.shade700,
                width: selected ? 2 : 1,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(label, style: const TextStyle(fontSize: 16)),

          const SizedBox(height: 8),

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? Colors.teal : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: selected
                ? Container(
                    margin: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
