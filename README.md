This is the Web UI Library for EzyAgric Web platforms. It is icluded on all EzyAgric Web platforms so keep that in mind while making changes. It was created by ```ssekaibrahim``` an is the initial contribitor. 

The main goal of this package is to make it easier for developers to create Web UI for EzyAgric Web platforms. It is a work in progress and will be updated as we go along.

## Getting started

For a fresh flutter project, add the following to your `pubspec.yaml` file:
```yaml
dependencies:
  ezyagric_web_ui:
    git:
      url: hutter project, add the following to your `pubspec.yaml` file:
```yaml
dependencies:
  ezyagric_web_ui:
    git:
      url: URL_ADDRESS.com/EzyAgric/ezyagric_web_ui.git
      ref: main

```

## Usage
 Open the file `main.dart` and add the following code:
```dart
import 'package:ezyagric_web_ui/ezyagric_web_ui.dart';
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
