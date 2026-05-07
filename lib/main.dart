import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mizan_app/core/database/cache_helper.dart';
import 'package:mizan_app/core/utils/secreen_size.dart';
import 'package:mizan_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MizanApp());
}

class MizanApp extends StatelessWidget {
  const MizanApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.intial(context);

    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
