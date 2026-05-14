import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
// import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/router/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'screens/dashboard/dashboard_screen.dart';
// import 'screens/main/components/side_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuAppController>(
      create: (context) => MenuAppController(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        routerConfig: router,
        // builder: (context, child) {
        //   // 在这里构建你的应用的主体部分
        //   return Scaffold(
        //     key: context.watch<MenuAppController>().scaffoldKey,
        //     // appBar: AppBar(
        //     //   title: Text('Flutter Admin Panel'),
        //     // ),
        //     drawer: SideMenu(),
        //     body: child,
        //   );
        // },
      ),
    );
  }
  // return MaterialApp.router(
  //   debugShowCheckedModeBanner: false,
  //   title: 'Flutter Admin Panel',
  //   theme: ThemeData.dark().copyWith(
  //     scaffoldBackgroundColor: bgColor,
  //     textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
  //         .apply(bodyColor: Colors.white),
  //     canvasColor: secondaryColor,
  //   ),
  //   // home: MultiProvider(
  //   //   providers: [
  //   //     ChangeNotifierProvider(
  //   //       create: (context) => MenuAppController(),
  //   //     ),
  //   //   ],
  //   //   child: MainScreen(child: DashboardScreen(),),
  //   // ),
  //   routerConfig: router,
  // );
}
