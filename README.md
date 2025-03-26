This is the Web UI Library for EzyAgric Web platforms. It is icluded on all EzyAgric Web platforms so keep that in mind while making changes.  ```ssekaibrahim``` is the initial contribitor to the project. 

The main goal of this package is to maintain a consistent feel and look across all EzyAgric Platforms and make it 10x to create Web UIs. It is a work in progress and will be updated as we go along.

## Getting started

For a fresh flutter project, add the following to your `pubspec.yaml` file then run ```flutter pub get```:

```yaml
dependencies:
  ezyagric_web_ui:
    git:
      url: https://github.com/ezyagric/flutter_web_ui_commons.git
      ref: main

```

## Usage
 Open the file `main.dart` and add the following code:
```dart
import 'package:web_ui_commons/web_ui_commons.dart';
```

Then add the ```ezyAgricWebTheme()``` to the `build` method:

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ezyAgricWebTheme(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
```

### Widgets
### Widgets

#### AppText
`AppText` is a custom text widget that wraps Flutter's Text widget with predefined styles and configurations. It supports different text types and sizes, and can be customized with additional styles.
Properties:
- `text`: The text to display.
- `type`: The type of text to display. Can be `AppTextType.title`, `AppTextType.subtitle`, `AppTextType.body`, or `AppTextType.caption`.
- `fontSize`: it's a double and it overrides the default size set by the `type`.

Usage:
```dart
AppText(
  text: 'Hello, World!',
  type: AppTextType.body,
);
```


