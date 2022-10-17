import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../theme.dart';

class GBottomNavBar extends StatefulWidget {
  const GBottomNavBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;
  @override
  State<GBottomNavBar> createState() => _GBottomNavBarState();
}

class _GBottomNavBarState extends State<GBottomNavBar> {
  var selectedIndex = 0;
  void itemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      color: (brightness == Brightness.light)
          ? Colors.transparent
          : Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: GNav(
          hoverColor: Colors.grey.shade600,
          iconSize: 26,
          tabActiveBorder: (brightness == Brightness.light)
              ? Border.all(color: Colors.grey.shade300, width: 1)
              : null,
          activeColor: AppColors.secondary,
          tabBackgroundColor: Theme.of(context).cardColor,
          // tabBorder: ,
          padding: const EdgeInsets.all(14),
          onTabChange: (index) {
            itemSelected(index);
          },
          gap: 8,
          tabs: const [
            GButton(
              icon: CupertinoIcons.chat_bubble_2_fill,
              text: 'Messages',
            ),
            GButton(
              icon: CupertinoIcons.phone_fill,
              text: 'Calls',
            ),
            GButton(
              icon: CupertinoIcons.person_2_fill,
              text: 'Contacts',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  var selectedIndex = 0;
  void itemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigatorBarItems(
                index: 0,
                label: 'Messages',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                isSelected: (selectedIndex == 0),
                onTap: itemSelected),
            NavigatorBarItems(
                index: 1,
                icon: CupertinoIcons.phone_fill,
                label: 'Calls',
                isSelected: (selectedIndex == 1),
                onTap: itemSelected),
            NavigatorBarItems(
                index: 2,
                icon: CupertinoIcons.person_2_fill,
                label: 'Contacts',
                isSelected: (selectedIndex == 2),
                onTap: itemSelected),
          ],
        ),
      ),
    );
  }
}

class NavigatorBarItems extends StatelessWidget {
  const NavigatorBarItems({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 23,
            color: isSelected
                ? ((Theme.of(context).brightness == Brightness.light)
                    ? AppColors.cardDark
                    : AppColors.secondary)
                : null,
          ),
          Text(
            label,
            style: isSelected
                ? TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: (Theme.of(context).brightness == Brightness.light)
                        ? AppColors.cardDark
                        : AppColors.secondary,
                  )
                : const TextStyle(fontSize: 13, color: AppColors.textFaded),
          ),
        ],
      ),
    );
  }
}
