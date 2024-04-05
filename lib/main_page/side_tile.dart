import 'package:adaptive_navigation_widget/adaptive_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/dash_board/dash_board.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/revenue/revenue.dart';
import 'package:kalliyath_villa_admin/users/user.dart';
import 'package:kalliyath_villa_admin/villas/villas.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar.dart';

// ignore: must_be_immutable
class SideTile extends StatelessWidget {
  SideTile({super.key, required this.size});

  Size size;
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      bloc: bloc1,
      builder: (context, state) {
        if (state is Indexstate) {
          return Expanded(
            child: AdaptiveNavigation(
              permanentDrawerBuilder: (context, destinations, currentIndex,
                  onDestinationSelected, child) {
                return Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ListView.builder(
                            itemCount: destinations.length,
                            itemBuilder: ((context, index) {
                              final data = destinations[index];
                              return sidebar(
                                  icon2: data.selectedIcon,
                                  istrue: index == currentIndex,
                                  ontap: () {
                                    onDestinationSelected(index);
                                    indexx = index;
                                    bloc1.add(Indexchange());
                                  },
                                  height: size.height / 10,
                                  width: size.width / 2,
                                  icon: data.icon,
                                  name: data.label);
                            }))),
                    Expanded(
                        flex: 6,
                        child: IndexedStack(
                          index: indexx,
                          children: const [
                            DashBoardPage(),
                            VillasPage(),
                            UserPage(),
                            RevenuePage()
                          ],
                        ))
                  ],
                );
              },
              initialIndex: 0,
              destinations: destinations,
              navigationBarOverflow: 4,
              railNavigationOverflow: 4,
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(35, 158, 158, 158),
                centerTitle: true,
                title: const Text(
                  'KALLIYATH VILLA',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Kalliyath',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              navigationTypeResolver: (context) {
                final screenWidth = MediaQuery.of(context).size.width;
                if (screenWidth > 1280) {
                  return NavigationType.permanentDrawer;
                } else if (screenWidth > 800) {
                  return NavigationType.extendedRail;
                } else if (screenWidth > 600) {
                  return NavigationType.rail;
                } else {
                  return NavigationType.bottom;
                }
              },
              onDestinationChanged: (context, location, index) {
                indexx = index;
                bloc1.add(Indexchange());
              },
              extendedRailNavigationOverflow: 5,
              child: IndexedStack(
                index: indexx,
                children: const [
                  DashBoardPage(),
                  VillasPage(),
                  UserPage(),
                  RevenuePage()
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
