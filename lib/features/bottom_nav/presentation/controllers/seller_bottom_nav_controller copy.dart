import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddimafrica/core/utils/constants/icon_path.dart';

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

class NavItem {
  final String title;
  final String iconPath;
  final String activeIconPath; // filled variant for selected state
  final int? badgeCount; // optional notification badge

  const NavItem({
    required this.title,
    required this.iconPath,
    String? activeIconPath,
    this.badgeCount,
  }) : activeIconPath = activeIconPath ?? iconPath;
}

// ─── Controller ─────────────────────────────────────────────────────────────

class SellerBottomNavController  extends GetxController {
  final RxInt currentIndex = 0.obs; // default to Home (index 0)

  // ── Nav items — add/remove/reorder freely ──────────────────────────────
  final List<NavItem> selleritems = const [
    NavItem(title: 'Home', iconPath: IconPath.home),
    NavItem(title: 'Products', iconPath: IconPath.box),
    NavItem(title: 'Orders', iconPath: IconPath.cart),
    NavItem(title: 'Revenue', iconPath: IconPath.revenue),
    NavItem(title: 'Profile', iconPath: IconPath.profile),
  ];

  // ── Screens — keep in the same order as items ──────────────────────────
  final List<Widget> screens = const [
    HomeScreen(),
    ProductsScreen(),
    OrdersScreen(),
    RevenueScreen(),
    ProfileScreen(),
  ];

  // ── Actions ────────────────────────────────────────────────────────────
  void changeIndex(int index) {
    assert(index >= 0 && index < selleritems.length, 'Index out of range');
    currentIndex.value = index;
  }

  void goTo(String tabTitle) {
    final idx = selleritems.indexWhere(
      (e) => e.title.toLowerCase() == tabTitle.toLowerCase(),
    );
    if (idx != -1) changeIndex(idx);
  }
}
