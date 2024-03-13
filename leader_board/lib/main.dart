import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:leader_board/controller/api_controller.dart';
import 'package:leader_board/dependencies/dependency_injection.dart';
import 'package:leader_board/ui/pages/home_page.dart';
import 'package:leader_board/ui/pages/main_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiController()),
      ],
      child: const MyApp(),
    ),
  );
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(
        child: HomePage(),
      ),
    );
  }
}
