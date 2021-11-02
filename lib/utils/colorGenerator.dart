import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorGenerator {
  static Future<PaletteGenerator> getMainColors(
      ImageProvider image, Size size, count) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(image,
            size: size, maximumColorCount: count);
    return paletteGenerator;
  }

  static PaletteColor? getColorByImportance(PaletteGenerator palette) {
    if (palette.lightVibrantColor != null) return palette.lightVibrantColor;
    if (palette.dominantColor != null) return palette.dominantColor;
    if (palette.lightMutedColor != null) return palette.lightMutedColor;
    if (palette.darkVibrantColor != null) return palette.darkVibrantColor;
    return palette.darkMutedColor;
  }
}
