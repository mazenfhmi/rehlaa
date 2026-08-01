import 'package:flutter/material.dart';

import 'package:rehlaa/generated/l10n/app_localizations.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    required this.title,
    required this.press,
    super.key,
  });

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      TextButton(
        onPressed: press,
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        child: Text(AppLocalizations.of(context).seeAllLabel),
      ),
    ],
  );
}
