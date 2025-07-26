import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/firebase_options.dart';
import 'package:restaurant_app/providers/menu_provider.dart';
import 'package:restaurant_app/routers/rounting_constant.dart';
import 'package:restaurant_app/routers/routers.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthBloc()..gentUser()),
        ChangeNotifierProvider(create: (context) => MenuProvider()),
      ],
      child: MaterialApp(
        title: 'Restaurant',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.generteRoute,
        initialRoute: RountingConstants.loginScreen,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.kDarkBackground,
            iconTheme: IconThemeData(color: Colors.white.withOpacity(0.7)),
          ),
          scaffoldBackgroundColor: AppColor.kDarkBackground,
        ),
      
      ),
    );
  }
}
