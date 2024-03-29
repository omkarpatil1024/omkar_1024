import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/bloc_observer.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'dart:io' show Platform;

class Global {
  static late StorageService storageService;

  static Future init() async {
    Bloc.observer=MyGlobalObserver();
    WidgetsFlutterBinding.ensureInitialized();

    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: FirebaseOptions(
                apiKey: 'AIzaSyA7DdnmekaFD8-yXwQP86hamon2SZqoCJc',
                appId: '1:736624840633:android:4784876e31e22b7873b068',
                messagingSenderId: '736624840633',
                projectId: 'ulearning-app-ba846'))
        : await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
