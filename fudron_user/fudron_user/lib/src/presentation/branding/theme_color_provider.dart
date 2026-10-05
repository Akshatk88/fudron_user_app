import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

/// A preset brand color the user can pick from Profile → App Theme.
///
/// `fudron` is the shipped default — its [color]/[buttonColor] match
/// [AppColors]' own defaults exactly, so never touching this setting gives the
/// brand palette.
enum AppThemeColor {
  fudron('Fudron Theme', Color(0xFFF0443E), Color(0xFFFF3B30), '🔴'),
  orange('Orange', Color(0xFFFF6B35), Color(0xFFFF5A36), '🟠'),
  coral('Coral', Color(0xFFE11D48), Color(0xFFEF4060), '🔴'),
  green('Green', Color(0xFF16A34A), Color(0xFF22B85C), '🟢'),
  blue('Blue', Color(0xFF3B82F6), Color(0xFF5B95F8), '🔵'),
  purple('Purple', Color(0xFF7B2D8E), Color(0xFF9B4FB0), '🟣');

  const AppThemeColor(this.label, this.color, this.buttonColor, this.emoji);

  final String label;
  final Color color;
  final Color buttonColor;
  final String emoji;
}

/// Persists and applies the selected [AppThemeColor].
///
/// Applying a color means reassigning the mutable [AppColors.primary] /
/// [AppColors.primaryButton] fields, then bumping [state] so every widget
/// watching [themeColorProvider] rebuilds instantly without an app restart.
final themeColorProvider = NotifierProvider<ThemeColorNotifier, AppThemeColor>(
  ThemeColorNotifier.new,
);

class ThemeColorNotifier extends Notifier<AppThemeColor> {
  static const _key = 'app_theme_color';

  @override
  AppThemeColor build() {
    unawaited(_load());
    return AppThemeColor.fudron;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    if (saved == null) {
      _apply(AppThemeColor.fudron);
      return;
    }
    for (final option in AppThemeColor.values) {
      if (option.name == saved) {
        _apply(option);
        return;
      }
    }
    _apply(AppThemeColor.fudron);
  }

  Future<void> setColor(AppThemeColor color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, color.name);
    _apply(color);
  }

  void _apply(AppThemeColor color) {
    AppColors.primary = color.color;
    AppColors.primaryButton = color.buttonColor;
    state = color;
  }
}
