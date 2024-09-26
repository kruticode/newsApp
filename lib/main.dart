import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/blocs/newsbloc/news_bloc.dart';
import 'package:news_app/blocs/newsbloc/news_states.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sign_up.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() async{
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
              initialState: NewsInitState(), newsRepositoty: NewsRepository()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            ),
        home: signup(),
      ),
    );
  }
}
