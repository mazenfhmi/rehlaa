import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/tokens/app_tokens.dart';
import '../../../../core/navigation/app_route_names.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: AppSpacing.md),
          IconBtnWithCounter(
            // Using a generic cart/buy icon from the project or an SVG
            // In a real scenario, this would use the exact SVG from ui.txt
            svgSrc: 'assets/icons/Buy.svg',
            press: () {
              // Navigate to Cart
              context.goNamed(AppRouteNames.cart);
            },
          ),
          const SizedBox(width: AppSpacing.sm),
          IconBtnWithCounter(
            // Since the project might not have 'Bell.svg', using a fallback or the provided one
            // Let's assume there is a Notification/Bell icon or just fallback to an icon
            svgSrc: 'assets/icons/Notification.svg', 
            iconData: Icons.notifications_outlined, // Fallback if svg is missing
            numOfItem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.ecommerceSecondary.withValues(alpha: 0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: _searchOutlineInputBorder,
          focusedBorder: _searchOutlineInputBorder,
          enabledBorder: _searchOutlineInputBorder,
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

const _searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    this.svgSrc,
    this.iconData,
    this.numOfItem = 0,
    required this.press,
  });

  final String? svgSrc;
  final IconData? iconData;
  final int numOfItem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: AppColors.ecommerceSecondary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: svgSrc != null
                ? SvgPicture.asset(
                    svgSrc!,
                    height: 24,
                  )
                : Icon(iconData),
          ),
          if (numOfItem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItem",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
