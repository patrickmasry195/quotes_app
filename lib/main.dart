import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc/quotes_bloc.dart';
import 'package:quotes_app/services/quotes_service.dart';
import 'package:quotes_app/views/quotes_view.dart';
import 'package:quotes_app/views/splash_view.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuotesBloc(quotesService: QuotesService())..add(GetQuoteEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: '/SplashView',
        routes: {
          '/SplashView': (context) => const SplashView(),
          '/QuotesView': (context) => const QuotesView(),
        },
      ),
    );
  }
}
