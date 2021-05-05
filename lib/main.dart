import 'package:bankx/pages/screens.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankX',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
