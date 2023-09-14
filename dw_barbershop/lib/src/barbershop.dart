import 'package:asyncstate/observers/async_navigator_observer.dart';
import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Barbershop extends StatelessWidget {

  const Barbershop({ super.key });

   @override
   Widget build(BuildContext context) {
       return AsyncStateBuilder(
        customLoader: BarbershopLoader(),
        builder: (AsyncNavigatorObserver){
          return MaterialApp(
            title: "DW Barbershop",
            navigatorObservers: [AsyncNavigatorObserver],
            routes: {
              '/': (_) => const SplashPage(),
          },
        );
       },
      );
  }
}