import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddimafrica/core/utils/constants/icon_path.dart';

import '../../domain/entities/nav_model.dart';

// ─── Placeholder screens ───────────────────────────────────────────────────
// Replace these with your actual screen widgets.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(label: 'Home');
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const _PlaceholderPage(label: 'Products');
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(label: 'Orders');
}

class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const _PlaceholderPage(label: 'Revenue');
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const _PlaceholderPage(label: 'Profile');
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(label, style: Theme.of(context).textTheme.headlineMedium),
    ),
  );
}

// ─── Nav Item Model ─────────────────────────────────────────────────────────

// ─── Controller ─────────────────────────────────────────────────────────────

class ArtistBottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs; // default to Home (index 0)

  // ── Screens — keep in the same order as items ──────────────────────────
  final List<Widget> screens = const [
    HomeScreen(),
    ProductsScreen(),
    OrdersScreen(),
    RevenueScreen(),
    ProfileScreen(),
  ];
  // ── Nav items — add/remove/reorder freely ──────────────────────────────
  final List<NavItem> artistitems = const [
    NavItem(title: 'Home', iconPath: IconPath.home),
    NavItem(title: 'Products', iconPath: IconPath.box),
    NavItem(title: 'Orders', iconPath: IconPath.cart),
    NavItem(title: 'Revenue', iconPath: IconPath.revenue),
    NavItem(title: 'Profile', iconPath: IconPath.profile),
  ];
  // ── Actions ────────────────────────────────────────────────────────────
  void changeIndex(int index) {
    assert(index >= 0 && index < artistitems.length, 'Index out of range');
    currentIndex.value = index;
  }

  void goTo(String tabTitle) {
    final idx = artistitems.indexWhere(
      (e) => e.title.toLowerCase() == tabTitle.toLowerCase(),
    );
    if (idx != -1) changeIndex(idx);
  }
}
