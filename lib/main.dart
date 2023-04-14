import 'package:libuta_sugbo_app/bloc_providers.dart';
import 'package:libuta_sugbo_app/helpers/hive_db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';
import 'routes.dart';
import 'package:cron/cron.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  HiveDBHelper hiveDBHelper = HiveDBHelper();
  await hiveDBHelper.openAndRegisterBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.get(),
      child: MaterialApp.router(
        title: 'LibutaSugboApp',
        routerConfig: router,
      ),
    );
  }
}
