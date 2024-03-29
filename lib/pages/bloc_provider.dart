// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ulearning/pages/register/bloc/register_bloc.dart';
// import 'package:ulearning/pages/sign_in/bloc/login_blocs.dart';
// import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
//
// import '../app_blocs.dart';
//
// class AppBlocProviders {
//   static get allBlocProviders => [
//         BlocProvider(
//           lazy: false,
//           // this will create bloc as soon as possible and also depend on the order of provider
//           create: (context) => WelcomeBlocs(),
//         ),
//         BlocProvider(
//           lazy: false, // this will create bloc as soon as possible
//           create: (context) => AppBlocs(),
//         ),
//         BlocProvider(create: (context) => SignInBlocs()),
//         BlocProvider(create: (context) => RegisterBlocs())
//       ];
// }
