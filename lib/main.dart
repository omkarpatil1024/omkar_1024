import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/app_blocs.dart';
import 'package:ulearning/app_events.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/global.dart';
import 'app_state.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (context) => AppBlocs(),
    //     child: MaterialApp(
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //         useMaterial3: true,
    //       ),
    //       home: MyHomePage(),
    //     ));
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: Size(360, 812),
        builder: (context, child) {
          return MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme:
                  AppBarTheme(elevation: 0, backgroundColor: Colors.white),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: Welcome(),
            onGenerateRoute: AppPages.GenerateRouteSettings,
            // home: ApplicationPage(),
            // initialRoute: "/",
            // routes: {
            //   "myHomePage": (context) => const MyHomePage(),
            //   "signIn": (context) => const SignIn(),
            //   "register": (context) => const Register()
            // }
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Counter Bloc"),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: "herotag1",
                    onPressed: () =>
                        BlocProvider.of<AppBlocs>(context).add(Increment()),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: "herotag2",
                    onPressed: () =>
                        BlocProvider.of<AppBlocs>(context).add(Decrement()),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          );
        },
      )),
    );
  }
}
