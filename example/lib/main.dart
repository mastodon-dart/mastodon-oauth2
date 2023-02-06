// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

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
                    instance: 'MASTODON_INSTANCE',
                    clientId: 'YOUR_CLIENT_ID',
                    clientSecret: 'YOUR_CLIENT_SECRET',
                    redirectUri: 'org.example.oauth://callback/',
                    customUriScheme: 'org.example.oauth',
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
