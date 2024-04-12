import 'package:adaptive_navigation_widget/adaptive_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/bookings/bookings.dart';
import 'package:kalliyath_villa_admin/categories/categories.dart';
import 'package:kalliyath_villa_admin/dash_board/dash_board.dart';
import 'package:kalliyath_villa_admin/login_page/login_page.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/revenue/revenue.dart';
import 'package:kalliyath_villa_admin/users/user.dart';
import 'package:kalliyath_villa_admin/villas/villas.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar.dart';

int indexx = 0;
int currentidx = 0;

// ignore: must_be_immutable
class SideTile extends StatelessWidget {
  SideTile({super.key, required this.size});

  Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      bloc: sidebarindex,
      builder: (context, state) {
        if (state is Indexstate) {
          return AdaptiveNavigation(
            permanentDrawerBuilder: (context, destinations, currentIndex,
                onDestinationSelected, child) {
              return Container(
                color: const Color.fromARGB(104, 231, 229, 229),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: destinations.length,
                                  itemBuilder: ((context, index) {
                                    final data = destinations[index];

                                    return sidebar(
                                        icon2: data.selectedIcon,
                                        istrue: index == currentidx,
                                        ontap: () {
                                          currentidx = index;
                                          onDestinationSelected(currentidx);
                                          indexx = index;
                                          sidebarindex.add(Indexchange());
                                        },
                                        height: size.height / 10,
                                        width: size.width / 2,
                                        icon: data.icon,
                                        name: data.label);
                                  })),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (ctx) => LoginPage()),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'Kaliiyath',
                                        fontSize: 15),
                                  )),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 5,
                        child: IndexedStack(
                          index: indexx,
                          children: [
                            const DashBoardPage(),
                            const VillasPage(),
                            const BookingPage(),
                            const UserPage(),
                            const RevenuePage(),
                            Categoriespage(),
                          ],
                        ))
                  ],
                ),
              );
            },
            initialIndex: 0,
            destinations: destinations,
            navigationBarOverflow: 4,
            railNavigationOverflow: 4,
            appBar: AppBar(
              backgroundColor: const Color(0xFF07162D),
              centerTitle: true,
              title: const Text(
                'KALLIYATH VILLA',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
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
              sidebarindex.add(Indexchange());
            },
            extendedRailNavigationOverflow: 6,
            child: IndexedStack(
              index: indexx,
              children: [
                const DashBoardPage(),
                const VillasPage(),
                const BookingPage(),
                const UserPage(),
                const RevenuePage(),
                Categoriespage(),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
