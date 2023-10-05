import 'package:cinnamon_riverpod_2/features/home/controller/home_controller.dart';
import 'package:cinnamon_riverpod_2/features/home/controller/home_state.dart';
import 'package:cinnamon_riverpod_2/infra/auth/service/firebase_auth_service.dart';
import 'package:cinnamon_riverpod_2/infra/http/dio_http_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../planner/trips/planner_home_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          controller.selectPage(SelectedHomePage.values[index]);
        },
        selectedIndex: state.page.index,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.travel_explore_outlined),
            icon: Icon(Icons.travel_explore),
            label: 'Trips',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people),
            icon: Icon(Icons.people_outline),
            label: 'Friends',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        PlannerHomePage(),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][state.page.index],
    );
  }
}
