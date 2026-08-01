import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/extensions/extensions.dart';

void main() {
  testWidgets('isRtl follows the surrounding text direction', (tester) async {
    bool? rtlValue;
    bool? ltrValue;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(
          builder: (context) {
            rtlValue = context.isRtl;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) {
            ltrValue = context.isRtl;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(rtlValue, isTrue);
    expect(ltrValue, isFalse);
  });
}
