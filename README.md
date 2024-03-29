# NÖ Finderlein <img height="40" src="assets/images/finderlein_logo_bunt.svg">

[![release](https://github.com/finderlein/noefinderlein_flutter/actions/workflows/release.yml/badge.svg)](https://github.com/finderlein/noefinderlein_flutter/actions/workflows/release.yml)

The NÖ Finderlein is a inofficial companion App for the Niederösterreich-Card for people who would like to have all important information for the associated destinations at their fingertip.

It additionaly provides an easy way to keep track of the visited locations and can show the destinations sorted by the distance from the current position.

[<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
     alt="Get it on F-Droid"
     height="80">](https://f-droid.org/packages/at.finderlein.noe/)
[<img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png" alt="Get it on Google Play" height="80">](https://play.google.com/store/apps/details?id=at.finderlein.noe)

### Development

If you want to help, pull requests are welcome.

This is a [Flutter](https://flutter.dev/) Project

### Getting Started

For help getting started with NÖ Finderlein development, view the
[Flutter online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#### Android development

For android development a file called `/android/key.properties` is needed with the following variables:

```
storeFile=PATH_TO_KEYSTORE
storePassword=KEYSTORE_PW
keyAlias=upload
keyPassword=ALIAS_PW
```

For more information, have a look at the [Android Keystore System Training](https://developer.android.com/training/articles/keystore)

### Assets

The `assets` directory houses images, fonts, and any other files that will be shipped with the application

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

### Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

To generate the translation files run:
```
flutter gen-l10n
```

### Database

Rebuilding the database table files can be done with

```
flutter pub run build_runner build
```

## Status

The backend status can be found here: [Status](https://stats.uptimerobot.com/x6jonFDyA)
