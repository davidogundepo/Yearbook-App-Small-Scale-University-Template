import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../notifier/sidebar_notifier.dart';
import 'package:provider/provider.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';

import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SideBarNotifier sideBarNotifier = Provider.of<SideBarNotifier>(context);
    return Scaffold(
      body: BlocProvider <NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            IgnorePointer(
              ignoring: sideBarNotifier.isOpened,
              child: BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  return navigationState as Widget;
                },
              ),
            ),
            SideBar()
          ],
        ),
      ),
    );
  }

}