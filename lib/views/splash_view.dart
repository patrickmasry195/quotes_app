import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/QuotesView');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInDown(
        duration: const Duration(seconds: 5),
        child: Image.asset(
          'assets/quotes_logo.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
