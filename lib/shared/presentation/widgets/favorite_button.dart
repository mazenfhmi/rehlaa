import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  final double size;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
    this.size = 48.0, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          color: isFavorite ? AppColors.primary : AppColors.black40,
        ),
      ),
    );
  }
}
