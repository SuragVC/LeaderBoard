import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leader_board/controller/network_controller.dart';
import 'package:leader_board/controller/state_controller.dart';
import 'package:leader_board/routes/routes.dart';
import 'package:leader_board/themes/dark_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        StreamProvider<NetworkStatus>(
          create: (context) =>
              NetworkController().networkStatusController.stream,
          initialData: NetworkStatus.Online,
        ),
        ChangeNotifierProvider(create: (_) => StateController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set system UI mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Provider.of<StateController>(context).themeData,
      darkTheme: darkTheme,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
