import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

class FavoriteButton extends StatelessWidget {

  const FavoriteButton({
    required this.isFavorite, required this.onTap, super.key,
    this.size = 48.0, 
  });
  final bool isFavorite;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
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
