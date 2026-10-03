import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/onboarding/presentation/widgets/cigarette_price_step.dart';
import 'package:quitra/l10n/app_localizations.dart';

void main() {
  Widget buildTestableWidget({
    required bool isPacket,
    required String cigarettePriceStr,
    required String packetPriceStr,
    required String cigarettesPerPacketStr,
    required ValueChanged<bool> onTypeChanged,
    required ValueChanged<String> onCigarettePriceChanged,
    required ValueChanged<String> onPacketPriceChanged,
    required ValueChanged<String> onCigarettesPerPacketChanged,
  }) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SingleChildScrollView(
          child: CigarettePriceStep(
            isPacket: isPacket,
            cigarettePriceStr: cigarettePriceStr,
            packetPriceStr: packetPriceStr,
            cigarettesPerPacketStr: cigarettesPerPacketStr,
            onTypeChanged: onTypeChanged,
            onCigarettePriceChanged: onCigarettePriceChanged,
            onPacketPriceChanged: onPacketPriceChanged,
            onCigarettesPerPacketChanged: onCigarettesPerPacketChanged,
          ),
        ),
      ),
    );
  }

  testWidgets('calls onCigarettePriceChanged with empty string when switching to packet tab', (tester) async {
    bool isPacket = false;
    String singlePrice = '1.5';
    String packetPrice = '';
    String perPacket = '';
    List<String> singlePriceChanges = [];

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) {
          return buildTestableWidget(
            isPacket: isPacket,
            cigarettePriceStr: singlePrice,
            packetPriceStr: packetPrice,
            cigarettesPerPacketStr: perPacket,
            onTypeChanged: (val) {
              setState(() {
                isPacket = val;
              });
            },
            onCigarettePriceChanged: (val) {
              singlePriceChanges.add(val);
              setState(() {
                singlePrice = val;
              });
            },
            onPacketPriceChanged: (val) => setState(() => packetPrice = val),
            onCigarettesPerPacketChanged: (val) => setState(() => perPacket = val),
          );
        },
      ),
    );

    expect(find.text('1.5'), findsOneWidget);

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.tap(find.text(l10n.priceOptionPacket));
    await tester.pumpAndSettle();

    expect(singlePriceChanges.contains(''), isTrue);
    expect(singlePrice, isEmpty);
  });

  testWidgets('calls onPacketPriceChanged and onCigarettesPerPacketChanged with empty string when switching to single tab', (tester) async {
    bool isPacket = true;
    String singlePrice = '';
    String packetPrice = '15.0';
    String perPacket = '20';
    List<String> packetChanges = [];
    List<String> perPacketChanges = [];

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) {
          return buildTestableWidget(
            isPacket: isPacket,
            cigarettePriceStr: singlePrice,
            packetPriceStr: packetPrice,
            cigarettesPerPacketStr: perPacket,
            onTypeChanged: (val) {
              setState(() {
                isPacket = val;
              });
            },
            onCigarettePriceChanged: (val) => setState(() => singlePrice = val),
            onPacketPriceChanged: (val) {
              packetChanges.add(val);
              setState(() {
                packetPrice = val;
              });
            },
            onCigarettesPerPacketChanged: (val) {
              perPacketChanges.add(val);
              setState(() {
                perPacket = val;
              });
            },
          );
        },
      ),
    );

    expect(find.text('15.0'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.tap(find.text(l10n.priceOptionSingle));
    await tester.pumpAndSettle();

    expect(packetChanges.contains(''), isTrue);
    expect(perPacketChanges.contains(''), isTrue);
    expect(packetPrice, isEmpty);
    expect(perPacket, isEmpty);
  });
}
