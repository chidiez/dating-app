import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:vanilla/nav/bottomNav.dart';
import 'package:vanilla/screens/account/agreement.dart';
import 'package:vanilla/screens/account/imagePicker.dart';
import 'package:vanilla/screens/account/logIn.dart';
import 'package:vanilla/screens/account/profileSetUp.dart';
import 'package:vanilla/screens/account/signUp.dart';
import 'package:vanilla/screens/account/signUpOptions.dart';
import 'package:vanilla/screens/account/verifyCode.dart';
import 'package:vanilla/services/firebaseServices.dart';
import 'package:vanilla/widgets/firebseOptions.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    FacebookAuth.i.webAndDesktopInitialize(
      appId: "1951600555051255",
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }

  runApp(const MyApp());
}

 final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({ Key? key}) : super(key: key);

  static final String title = 'Vanilla';

  @override
  Widget build(BuildContext context) => MaterialApp(
        //scaffoldMessengerKey: Utils.messengerKey,
        title: title,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        //home: const SetProfilePage(),
        //home: AuthService().handleAuthState(),
        home: MainPage(),
        theme: ThemeData(
            //textTheme: GoogleFonts.proximaNovaTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.pink, splashColor: Colors.transparent),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              return const VerifyCode();
            } else {
              return const SigningOptions();
            }
          },
        ),
      );
}



//5D1049


/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Vanilla',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        routes: {
          SigningOptions.routeName: (context) =>
          const SigningOptions(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignUpScreen.routeName: (context) =>  const SignUpScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const BottomNav();
    }
    return const SigningOptions();
  }
} */