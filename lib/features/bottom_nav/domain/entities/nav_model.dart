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
