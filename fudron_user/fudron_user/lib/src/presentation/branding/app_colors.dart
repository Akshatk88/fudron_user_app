import 'package:flutter/material.dart';

/// Fudron design tokens.
///
/// Palette is based on the Fudron logo:
/// - Red / Orange: Primary brand and CTA colour
/// - Dark Charcoal: Logo text, icons and strong text
/// - White: Clean background and surfaces
///
/// The palette intentionally avoids the old magenta/purple/teal combination
/// so the complete app stays visually consistent with the Fudron logo.
class AppColors {
  // ==================== BRAND COLORS ====================

  /// Main Fudron red.
  ///
  /// Mutable so ThemeColorNotifier can still change the primary theme
  /// dynamically if required.
  static Color primary = const Color(0xFFF0443E);

  /// Main button colour.
  static Color primaryButton = const Color(0xFFFF3B30);

  /// Secondary Fudron orange-red.
  static const Color secondary = Color(0xFFFF5A36);

  static const Color secondaryLight = Color(0xFFFF795B);

  /// Very light red/orange surface.
  static const Color secondaryTint = Color(0xFFFFF0ED);

  /// Supporting orange accent from the logo.
  static const Color accent = Color(0xFFFF6B35);

  static const Color accentBright = Color(0xFFFF7A45);

  static const Color accentLight = Color(0xFFFF9A72);

  static const Color accentDeep = Color(0xFFE84A22);

  static const Color accentDark = Color(0xFFB93619);

  static const Color accentTint = Color(0xFFFFF1EB);

  static const Color accentTintStrong = Color(0xFFFFDDD2);

  static const Color accentTintDark = Color(0xFF321B16);

  /// Dark charcoal used in the Fudron logo wordmark and scooter.
  static const Color brandNeutral = Color(0xFF25262B);

  // ==================== BRAND GRADIENT ====================

  /// Main Fudron logo-inspired gradient.
  ///
  /// Red → orange-red → orange.
  static const List<Color> brandGradient = [
    Color(0xFFF0443E),
    Color(0xFFFF3B30),
    Color(0xFFFF6B35),
  ];

  /// Short gradient for buttons, chips and FABs.
  static const List<Color> brandGradientShort = [
    Color(0xFFF0443E),
    Color(0xFFFF5A36),
  ];

  // ==================== DERIVED BRAND SHADES ====================

  // These are getters so they automatically follow the current [primary]
  // colour if ThemeColorNotifier changes it.

  static HSLColor get _hsl => HSLColor.fromColor(primary);

  static Color _shade(double lightness, double saturation) =>
      _hsl.withLightness(lightness).withSaturation(saturation).toColor();

  /// Lighter version of primary.
  static Color get primaryLight => _shade(0.62, _hsl.saturation);

  /// Darker version of primary.
  static Color get primaryDeep => _shade(0.42, _hsl.saturation);

  /// Strong readable brand text/icon colour.
  static Color get primaryDeepText =>
      _shade(0.30, (_hsl.saturation * 0.85).clamp(0.0, 0.9));

  /// Very light brand wash.
  static Color get primaryTint =>
      _shade(0.96, (_hsl.saturation * 0.9).clamp(0.0, 1.0));

  /// Light brand fill.
  static Color get primaryTintStrong =>
      _shade(0.91, (_hsl.saturation * 0.9).clamp(0.0, 1.0));

  /// Muted brand fill.
  static Color get primarySoft =>
      _shade(0.80, (_hsl.saturation * 0.9).clamp(0.0, 1.0));

  /// Dark-mode equivalent of primaryTint.
  static Color get primaryTintDark =>
      _shade(0.12, (_hsl.saturation * 0.35).clamp(0.0, 0.45));

  /// Dark-mode equivalent of primaryTintStrong.
  static Color get primaryTintDarkStrong =>
      _shade(0.20, (_hsl.saturation * 0.4).clamp(0.0, 0.5));

  /// Brand colour with custom opacity.
  static Color primaryAlpha(double alpha) => primary.withValues(alpha: alpha);

  // ==================== NEUTRAL SCALE ====================

  /// Very light background.
  static const Color neutral50 = Color(0xFFFAFAFA);

  /// Light grey.
  static const Color neutral100 = Color(0xFFF5F5F5);

  /// Border/light divider.
  static const Color neutral200 = Color(0xFFE8E8E8);

  /// Medium-light grey.
  static const Color neutral300 = Color(0xFFD5D5D5);

  /// Medium grey.
  static const Color neutral400 = Color(0xFFA6A6A6);

  /// Secondary text.
  static const Color neutral500 = Color(0xFF737373);

  /// Dark secondary text.
  static const Color neutral600 = Color(0xFF555555);

  /// Strong dark grey.
  static const Color neutral700 = Color(0xFF38383B);

  /// Main dark text.
  static const Color neutral900 = Color(0xFF1E1E21);

  // ==================== DARK THEME COLORS ====================

  /// Main dark background.
  static const Color backgroundDark = Color(0xFF121212);

  /// Dark surface.
  static const Color surfaceDark = Color(0xFF1A1A1C);

  /// Dark card.
  static const Color cardDark = Color(0xFF222225);

  /// Dark container.
  static const Color darkContainer = Color(0xFF2B2B2F);

  /// Dark border.
  static const Color darkBorder = Color(0xFF3A3A3F);

  /// Dark theme primary text.
  static const Color textPrimaryDark = Color(0xFFFFFFFF);

  /// Dark theme secondary text.
  static const Color textSecondaryDark = Color(0xFFB5B5B8);

  /// Dark theme border.
  static const Color borderDark = Color(0xFF333338);

  // ==================== LIGHT THEME COLORS ====================

  /// Main app background.
  static const Color backgroundLight = neutral50;

  /// Main white surface.
  static const Color surfaceLight = Color(0xFFFFFFFF);

  /// Secondary light surface.
  static const Color secondarySurfaceLight = neutral100;

  /// Light container.
  static const Color lightContainer = neutral50;

  /// Card background.
  static const Color cardLight = Color(0xFFFFFFFF);

  /// Light grey background.
  static const Color lightGreyBg = neutral100;

  /// Main light-theme text.
  static const Color textPrimaryLight = neutral900;

  /// Dark text alias.
  static const Color textDark = neutral900;

  /// Secondary light-theme text.
  static const Color textSecondaryLight = neutral500;

  /// Tertiary text.
  static const Color textTertiaryLight = neutral400;

  /// Normal border.
  static const Color borderLight = neutral200;

  /// Subtle border.
  static const Color borderSubtle = neutral200;

  /// Extra subtle border.
  static const Color borderExtraSubtle = neutral100;

  /// Divider.
  static const Color dividerLight = neutral100;

  /// Disabled element.
  static const Color disabled = neutral300;

  /// Text/icon on disabled element.
  static const Color onDisabled = neutral500;

  /// Standard shadows.
  static const Color shadow1 = Color(0x14000000);

  static const Color shadow2 = Color(0x0A000000);

  // ==================== STATUS COLORS ====================

  /// Success.
  static const Color success = Color(0xFF16A34A);

  static const Color successDeep = Color(0xFF0F7A37);

  static const Color successSoft = Color(0xFFE7F7EE);

  /// Warning.
  static const Color warning = Color(0xFFF59E0B);

  static const Color warningSoft = Color(0xFFFEF4E3);

  /// Error.
  static const Color error = Color(0xFFE11D48);

  static const Color errorDeep = Color(0xFFBE123C);

  static const Color errorSoft = Color(0xFFFDE9EE);

  /// Rating.
  static const Color rating = Color(0xFFFFB01D);

  static const Color ratingStar = Color(0xFFFFB01D);

  /// Food type indicators.
  static const Color veg = Color(0xFF16A34A);

  static const Color nonVeg = Color(0xFFDC2626);

  // ==================== LEGACY ALIASES ====================
  //
  // These are kept so existing screens using the old names don't break.
  // They now point to the new Fudron red/orange palette.

  /// Previously purple.
  /// Now maps to Fudron secondary orange-red.
  static const Color accentPurple = secondary;

  /// Previously pink.
  /// Now maps to Fudron primary button red.
  static const Color accentPink = Color(0xFFFF3B30);

  /// Previously blue/teal.
  /// Now maps to the Fudron orange supporting accent.
  static const Color accentBlue = accent;
}
