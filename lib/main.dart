import 'package:chatapp/theme.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(ChatApp(
      appTheme: AppTheme(),
    ));

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key, required this.appTheme}) : super(key: key);

  final AppTheme appTheme;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
