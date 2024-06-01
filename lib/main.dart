import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rapidor_ecommerce/global/config/config.dart';
import 'package:rapidor_ecommerce/global/config/db_key.dart';
import 'package:rapidor_ecommerce/global/provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rapidor_ecommerce/global/routes/routes.dart';
import 'package:rapidor_ecommerce/modules/products/model/product.model.dart';

void main()async {
// setupGetIt();

    WidgetsFlutterBinding.ensureInitialized();
  //*--- Hive
  Directory document = await getApplicationDocumentsDirectory();
 Hive.init(document.path);
  Hive.registerAdapter(RatingAdapter());
   Hive.registerAdapter(ProductListModelAdapter());
  cartProducts =  await Hive.openBox<ProductListModel>(Config.cartName);

//*--- Screen_orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Platform.isIOS
                ? CupertinoApp(
                    title: 'Rapidor',
                    routes: routes,
                    initialRoute: '/',
                    navigatorKey: navigationKey,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      DefaultWidgetsLocalizations.delegate,
                      DefaultMaterialLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                    ],
                  )
                : MaterialApp(
                    routes: routes,
                    title: 'Rapidor',
                    initialRoute: '/',
                    navigatorKey: navigationKey,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      useMaterial3: true,
                    ),
                  );
      },
      designSize: const Size(430, 932),
    );
  }
}

