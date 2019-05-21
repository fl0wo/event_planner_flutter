import 'package:flutter/material.dart';

import 'ui/login_page.dart';

class LoginFaceBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Event It',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new LoginPage(),
    );
  }
}
