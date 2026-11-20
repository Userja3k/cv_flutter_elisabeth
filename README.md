# CV Flutter - Elisabeth Mudahama

Application Flutter de portfolio présentant mon CV, ma famille et mes coordonnées.

## Fonctionnalités

- Connexion de démonstration avec validation des champs.
- CV : profil, formation, expériences, compétences et langues.
- Page Famille avec présentation des membres.
- Page Contact avec raccourcis téléphone, email, carte et LinkedIn.
- Navigation personnalisée en forme de pilule.

## Design

- Material 3, avec une palette cyan et bleu clair.
- Police Inter via `google_fonts`.
- Interface adaptée au mobile Android.

## Structure du code

- `lib/main.dart` : démarrage de l’application et thème global.
- `lib/screens/login_screen.dart` : formulaire de connexion.
- `lib/screens/main_screen.dart` : navigation entre les pages.
- `lib/screens/home_screen.dart` : CV.
- `lib/screens/family_screen.dart` : famille.
- `lib/screens/contact_screen.dart` : coordonnées.

La photo du profil est chargée depuis `assets/moi.jpeg`.

## Installation et lancement

Depuis le dossier du projet :

```shell
flutter pub get
flutter run
```

## Captures d’écran

Ajoutez vos captures d’écran dans le dépôt et insérez-les ici avant de publier le projet.
