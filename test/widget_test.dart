import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cv_flutter_elisabeth/main.dart';

void main() {
  testWidgets('connexion ouvre le portfolio et ses pages', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenue'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Elisabeth');
    await tester.enterText(find.byType(TextFormField).at(1), 'portfolio');
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.text('Mon Profil'), findsOneWidget);
    expect(find.text('Elisabeth Mudahama'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.family_restroom));
    await tester.pumpAndSettle();
    expect(find.text('Ma Famille'), findsOneWidget);
    final familyPhotos = tester.widgetList<Image>(find.byType(Image));
    expect(
      familyPhotos.map((photo) => (photo.image as AssetImage).assetName),
      containsAll(['assets/sister.jpeg', 'assets/brother.jpeg']),
    );

    await tester.tap(find.byIcon(Icons.contact_mail));
    await tester.pumpAndSettle();
    expect(find.text('Contactez-moi'), findsOneWidget);
    expect(find.text('mudahamaelisabeth@gmail.com'), findsOneWidget);
  });

  testWidgets('les champs vides affichent une validation', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Se connecter'));
    await tester.pump();

    expect(find.text('Entrez un identifiant'), findsOneWidget);
    expect(find.text('Entrez un mot de passe'), findsOneWidget);
  });
}
