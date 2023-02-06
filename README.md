<p align="center">
  <a href="https://github.com/mastodon-dart/mastodon-oauth2">
    <img alt="mastodon_oauth2" width="500px" src="https://user-images.githubusercontent.com/13072231/202434467-6efce2ed-83e3-4975-b21c-6388fe51c820.png">
  </a>
</p>

<p align="center">
  <b>The Optimized and Easiest Way to Integrate OAuth 2.0 with Mastodon API in Flutter 🎯</b>
</p>

---

[![GitHub Sponsor](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=ff69b4)](https://github.com/sponsors/myConsciousness)
[![GitHub Sponsor](https://img.shields.io/static/v1?label=Maintainer&message=myConsciousness&logo=GitHub&color=00acee)](https://github.com/myConsciousness)

[![pub package](https://img.shields.io/pub/v/mastodon_oauth2.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/mastodon_oauth2)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/mastodon_oauth2)](https://pub.dev/packages/mastodon_oauth2/)
[![Test](https://github.com/mastodon-dart/mastodon-oauth2/actions/workflows/test.yml/badge.svg)](https://github.com/mastodon-dart/mastodon-oauth2/actions/workflows/test.yml)
[![Analyzer](https://github.com/mastodon-dart/mastodon-oauth2/actions/workflows/analyzer.yml/badge.svg)](https://github.com/mastodon-dart/mastodon-oauth2/actions/workflows/analyzer.yml)
[![Issues](https://img.shields.io/github/issues/mastodon-dart/mastodon-oauth2?logo=github&logoColor=white)](https://github.com/mastodon-dart/mastodon-oauth2/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/mastodon-dart/mastodon-oauth2?logo=github&logoColor=white)](https://github.com/mastodon-dart/mastodon-oauth2/pulls)
[![Stars](https://img.shields.io/github/stars/mastodon-dart/mastodon-oauth2?logo=github&logoColor=white)](https://github.com/mastodon-dart/mastodon-oauth2)
[![Code size](https://img.shields.io/github/languages/code-size/mastodon-dart/mastodon-oauth2?logo=github&logoColor=white)](https://github.com/mastodon-dart/mastodon-oauth2)
[![Last Commits](https://img.shields.io/github/last-commit/mastodon-dart/mastodon-oauth2?logo=git&logoColor=white)](https://github.com/mastodon-dart/mastodon-oauth2/commits/main)
[![License](https://img.shields.io/github/license/mastodon-dart/mastodon-oauth2?logo=open-source-initiative&logoColor=green)](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/LICENSE)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/CODE_OF_CONDUCT.md)

---

<!-- TOC -->

- [1. Guide 🌎](#1-guide-)
  - [1.1. Getting Started ⚡](#11-getting-started-)
    - [1.1.1. Install Library](#111-install-library)
    - [1.1.2. Import](#112-import)
    - [1.1.3. Setup](#113-setup)
      - [1.1.3.1. Android](#1131-android)
      - [1.1.3.2. iOS](#1132-ios)
      - [1.1.3.3. Web](#1133-web)
    - [1.1.4. Implementation](#114-implementation)
  - [1.2. Contribution 🏆](#12-contribution-)
  - [1.3. Contributors ✨](#13-contributors-)
  - [1.4. Support ❤️](#14-support-️)
  - [1.5. License 🔑](#15-license-)
  - [1.6. More Information 🧐](#16-more-information-)

<!-- /TOC -->

# 1. Guide 🌎

This library provides the easiest way to authenticate with [OAuth 2.0](https://docs.joinmastodon.org/methods/apps/oauth/) for [Mastodon API](https://docs.joinmastodon.org/client/intro/) in **Flutter** apps.

**Show some ❤️ and star the repo to support the project.**

## 1.1. Getting Started ⚡

### 1.1.1. Install Library

```bash
 flutter pub add mastodon_oauth2
```

### 1.1.2. Import

```dart
import 'package:mastodon_oauth2/mastodon_oauth2.dart';
```

### 1.1.3. Setup

At first to test with this library, let's set `org.example.android.oauth://callback/` as a callback URI in your `developer page`.

You can see `developer page` of mastodon in the link like below.

- `https://mastodon.instance/settings/applications`

And then, specify your `redirect uri` like below.

![Set Callback URI](https://user-images.githubusercontent.com/13072231/202414635-ed28fc1b-1874-413f-8d77-8376771f1b09.png)

#### 1.1.3.1. Android

On Android you must first set the minSdkVersion in the ***build.gradle*** file:

```gradle
defaultConfig {
   ...
   minSdkVersion 18
   ...
```

Also it's necessary to add the following definitions to `AndroidManifest.xml`.

```xml
<activity android:name="com.linusu.flutter_web_auth_2.CallbackActivity" android:exported="true">
    <intent-filter android:label="flutter_web_auth_2">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="org.example.android.oauth" android:host="callback" />
    </intent-filter>
</activity>
```

Finally you need to set this redirect url for `MastodonOAuth2Client`.

```dart
final oauth2 = MastodonOAuth2Client(
  // Specify mastodon instance like "mastodon.social"
  instance: 'MASTODON_INSTANCE'
  clientId: 'YOUR_CLIENT_ID',
  clientSecret: 'YOUR_CLIENT_SECRET',
  redirectUri: 'org.example.android.oauth://callback/',
  customUriScheme: 'org.example.android.oauth',
);
```

You can see details [here](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/example/android/app/src/main/AndroidManifest.xml).

#### 1.1.3.2. iOS

On iOS you need to set the platform in the ***ios/Podfile*** file:

```profile
platform :ios, '11.0'
```

#### 1.1.3.3. Web

For Web, the implementation method for using this package is the same as for `Android` and `iOS` above, but it's necessary to separately create HTML for the destination to be redirected to after authentication.

First, you will need to create the following HTML directly under your `web` folder in preparation for OAuth authentication in your web browser. Then, let's save this HTML file with the name `auth.html`.

```html
<!DOCTYPE html>
<title>Authentication complete</title>
<p>
  Authentication is complete. If this does not happen automatically, please
  close the window.
  <script>
    window.opener.postMessage(window.location.href, window.location.origin);
    window.close();
  </script>
</p>
```

And now your `web` folder should look like [this](https://github.com/mastodon-dart/mastodon-oauth2/tree/main/example/web).

![Set auth.html](https://user-images.githubusercontent.com/13072231/216907094-56a44873-c7fb-435b-bac7-060fa34c6ed0.png)

And then, unlike Android and iOS, the redirect URL should refer to this created `auth.html`. So, now let's set it to `http://localhost:5555/auth.html` for example.

![Set redirect uri for Web](https://user-images.githubusercontent.com/13072231/216907843-12132c37-dde0-403f-8d58-27d0dc134a8c.png)

Finally, you need to set this redirect url for `MastodonOAuth2Client`.

```dart
final oauth2 = MastodonOAuth2Client(
  // Specify mastodon instance like "mastodon.social"
  instance: 'MASTODON_INSTANCE'
  clientId: 'YOUR_CLIENT_ID',
  clientSecret: 'YOUR_CLIENT_SECRET',
  redirectUri: 'http://localhost:5555/auth.html',
  customUriScheme: 'http://localhost:5555/auth.html',
);
```

### 1.1.4. Implementation

Now all that's left is to launch the following example Flutter app and press the button to start the authentication process with **OAuth 2.0**!

After pressing the `Authorize` button, a redirect will be performed and you will see that you have obtained your `bearer token`.

```dart
import 'package:flutter/material.dart';

import 'package:mastodon_oauth2/mastodon_oauth2.dart';

void main() {
  runApp(const MaterialApp(home: Example()));
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String? _accessToken;
  String? _refreshToken;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Access Token: $_accessToken'),
              ElevatedButton(
                onPressed: () async {
                  final oauth2 = MastodonOAuth2Client(
                    // Specify mastodon instance like "mastodon.social"
                    instance: 'MASTODON_INSTANCE'
                    clientId: 'YOUR_CLIENT_ID',
                    clientSecret: 'YOUR_CLIENT_SECRET',

                    // Replace redirect url as you need.
                    redirectUri: 'org.example.android.oauth://callback/',
                    customUriScheme: 'org.example.android.oauth',
                  );

                  final response = await oauth2.executeAuthCodeFlow(
                    scopes: [
                      Scope.read,
                      Scope.write,
                    ],
                  );

                  super.setState(() {
                    _accessToken = response.accessToken;
                  });
                },
                child: const Text('Push!'),
              )
            ],
          ),
        ),
      );
}
```

## 1.2. Contribution 🏆

If you would like to contribute to `mastodon-oauth2`, please create an [issue](https://github.com/mastodon-dart/mastodon-oauth2/issues) or create a Pull Request.

There are many ways to contribute to the OSS. For example, the following subjects can be considered:

- There are scopes that are not implemented.
- Documentation is outdated or incomplete.
- Have a better way or idea to achieve the functionality.
- etc...

You can see more details from resources below:

- [Contributor Covenant Code of Conduct](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/CODE_OF_CONDUCT.md)
- [Contribution Guidelines](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/CONTRIBUTING.md)
- [Style Guide](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/STYLEGUIDE.md)

Or you can create a [discussion](https://github.com/mastodon-dart/mastodon-oauth2/discussions) if you like.

**Feel free to join this development, diverse opinions make software better!**

## 1.3. Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="20%"><a href="http://shinyakato.dev"><img src="https://avatars.githubusercontent.com/u/13072231?v=4?s=100" width="100px;" alt="Shinya Kato / 加藤 真也"/><br /><sub><b>Shinya Kato / 加藤 真也</b></sub></a><br /><a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=myConsciousness" title="Code">💻</a> <a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=myConsciousness" title="Documentation">📖</a> <a href="#design-myConsciousness" title="Design">🎨</a> <a href="#example-myConsciousness" title="Examples">💡</a> <a href="#maintenance-myConsciousness" title="Maintenance">🚧</a> <a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=myConsciousness" title="Tests">⚠️</a> <a href="#tutorial-myConsciousness" title="Tutorials">✅</a></td>
       <td align="center" valign="top" width="20%"><a href="http://markos.dev"><img src="https://avatars.githubusercontent.com/u/6950843?v=4?s=100" width="100px;" alt="Mark O'Sullivan"/><br /><sub><b>Mark O'Sullivan</b></sub></a><br /><a href="#ideas-MarkOSullivan94" title="Ideas, Planning, & Feedback">🤔</a></td>
       <td align="center" valign="top" width="20%"><a href="http://abrah.am"><img src="https://avatars.githubusercontent.com/u/3341?v=4?s=100" width="100px;" alt="Abraham Williams"/><br /><sub><b>Abraham Williams</b></sub></a><br /><a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=abraham" title="Code">💻</a> <a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=abraham" title="Documentation">📖</a> <a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=abraham" title="Tests">⚠️</a></td>
       <td align="center" valign="top" width="20%"><a href="https://github.com/SkywaveTM"><img src="https://avatars.githubusercontent.com/u/4926340?v=4?s=100" width="100px;" alt="YeongJun"/><br /><sub><b>YeongJun</b></sub></a><br /><a href="https://github.com/mastodon-dart/mastodon-oauth2/commits?author=SkywaveTM" title="Documentation">📖</a> <a href="#ideas-SkywaveTM" title="Ideas, Planning, & Feedback">🤔</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## 1.4. Support ❤️

The simplest way to show us your support is by **giving the project a star** at [GitHub](https://github.com/mastodon-dart/mastodon-oauth2) and [Pub.dev](https://pub.dev/packages/mastodon_oauth2).

You can also support this project by **becoming a sponsor** on GitHub:

<div align="left">
  <p>
    <a href="https://github.com/sponsors/myconsciousness">
      <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="myconsciousness" />
    </a>
  </p>
</div>

## 1.5. License 🔑

All resources of `mastodon_oauth2` is provided under the `BSD-3` license.

```license
Copyright 2022 Kato Shinya. All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided the conditions.
```

> **Note**</br>
> License notices in the source are strictly validated based on `.github/header-checker-lint.yml`. Please check [header-checker-lint.yml](https://github.com/mastodon-dart/mastodon-oauth2/tree/main/.github/header-checker-lint.yml) for the permitted standards.

## 1.6. More Information 🧐

`mastodon_oauth2` was designed and implemented by **_Kato Shinya ([@myConsciousness](https://github.com/myConsciousness))_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/mastodon-dart/mastodon-oauth2/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/mastodon_oauth2/latest/mastodon_oauth2/mastodon_oauth2-library.html)
- [Release Note](https://github.com/mastodon-dart/mastodon-oauth2/releases)
- [Bug Report](https://github.com/mastodon-dart/mastodon-oauth2/issues)
