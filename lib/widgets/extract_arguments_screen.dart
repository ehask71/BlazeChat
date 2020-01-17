import 'package:flutter/material.dart';

// A widget that extracts the necessary arguments from the ModalRoute.
class GroupArguments extends StatelessWidget {
  static const routeName = '/group';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final GroupArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}