# NÖ Finderlein <img height="40" src="https://raw.githubusercontent.com/derqurps/noefinderlein-flutter/master/assets/images/3.0x/finderlein_logo_bunt.png">

The NÖ Finderlein is a inofficial companion App for the Niederösterreich-Card for people who would like to have all important information for the associated destinations at their fingertip.

It additionaly provides an easy way to keep track of the visited locations and can show the destinations sorted by the distance from the current position.

### Development

If you want to help, pull requests are welcome.

This is a [Flutter](https://flutter.dev/) Project

### Getting Started

For help getting started with NÖ Finderlein development, view the
[Flutter online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

A File called `/lib/auth/secrets.dart` is needed with the following declared variables:

```
var mapAccessToken = "<mapbox api key>";
var mapUrl = "https://api.mapbox.com/styles/v1/.....";
var mapUrlDark = "https://api.mapbox.com/styles/v1/.....";

var dataApi = "https://noecard.reitschmied.at/apiv2/";
```

#### Android development

For android development a file called `/android/noefinderlein_keystore.txt` is needed with the following variables:

```
noefinderlein_keystore=PATH_TO_KEYSTORE
noefinderlein_keystore_pw=KEYSTORE_PW
noefinderlein_alias=noefinderlein
noefinderlein_alias_pw=ALIAS_PW
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
